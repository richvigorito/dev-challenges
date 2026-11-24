package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"sync"
	"time"

	"github.com/gocolly/colly/v2"
)

var safeCharsRegex = regexp.MustCompile(`[^a-zA-Z0-9_]+`)

type SiteScraper struct {
	BaseCollector *colly.Collector
	Pages         []*Page
}

type Page struct {
	PageNumber  int
	PageURL     string
	Collector   *colly.Collector
	TimeElapsed time.Duration
	Images      []string
}

type Option func(*colly.Collector)

func NewSiteScraper(c *colly.Collector) *SiteScraper {
	return &SiteScraper{
		BaseCollector: c,
		Pages:         []*Page{},
	}
}

func (ss *SiteScraper) addPage(url string) {
	ss.Pages = append(ss.Pages, &Page{
		PageNumber: len(ss.Pages) + 1,
		PageURL:    url,
		Collector:  ss.BaseCollector.Clone(),
	})
}

func (p *Page) Scrape(downloadsDir string) {
	start := time.Now()
	defer func() {
		p.TimeElapsed = time.Since(start)
	}()

	p.Collector.OnRequest(func(r *colly.Request) {
		fmt.Println("Visiting:", r.URL.String())
	})

	p.Collector.OnHTML("article.product_pod img", func(e *colly.HTMLElement) {
		relSrc := e.Attr("src")
		fullImgURL := e.Request.AbsoluteURL(relSrc)
		altText := e.Attr("alt")

		origBase := filepath.Base(fullImgURL)
		ext := filepath.Ext(origBase)
		hash := strings.TrimSuffix(origBase, ext)

		cleanTitle := strings.ReplaceAll(altText, " ", "")
		cleanTitle = safeCharsRegex.ReplaceAllString(cleanTitle, "")

		fileName := fmt.Sprintf("%d_%s_%s%s", p.PageNumber, hash, cleanTitle, ext)

		if err := downloadImage(fullImgURL, downloadsDir, fileName); err != nil {
			log.Println("Failed to download:", err)
			return
		}

		p.Images = append(p.Images, fileName)
	})

	p.Collector.OnError(func(r *colly.Response, err error) {
		log.Println("Request URL:", r.Request.URL, "failed with error:", err)
	})

	if err := p.Collector.Visit(p.PageURL); err != nil {
		log.Println("Visit failed:", err)
	}
}

func (ss *SiteScraper) Scrape(downloadsDir string) {
	var wg sync.WaitGroup
	sem := make(chan struct{}, 10)
	for _, p := range ss.Pages {
		wg.Add(1)
		go func(page *Page) {
			defer wg.Done()

			sem <- struct{}{}
			defer func() { <-sem }()

			page.Scrape(downloadsDir)
		}(p)
	}
	wg.Wait()
}

func main() {
	start := time.Now()
	c := colly.NewCollector(
		colly.AllowedDomains("books.toscrape.com"),
	)

	scraper := NewSiteScraper(c)

	for i := 1; i <= 10; i++ {
		scraper.addPage(fmt.Sprintf("https://books.toscrape.com/catalogue/category/books_1/page-%d.html", i))
	}

	downloadsDir, err := getDownloadsFolder()
	if err != nil {
		log.Fatal(err)
	}

	scraper.Scrape(downloadsDir)

	// Print summary after all goroutines finish
	for _, p := range scraper.Pages {
		fmt.Printf("Page: %s | Images: %d | Took: %v\n", p.PageURL, len(p.Images), p.TimeElapsed)
	}
	fmt.Printf("\n\n------------------\n")
	fmt.Printf("Total Elapsed time: %v\n", time.Since(start))
}

func downloadImage(imgURL, folder, fileName string) error {
	resp, err := http.Get(imgURL)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	filePath := filepath.Join(folder, fileName)
	file, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer file.Close()

	_, err = io.Copy(file, resp.Body)
	return err
}

func getDownloadsFolder() (string, error) {
	cwd, err := os.Getwd()
	if err != nil {
		return "", err
	}

	timestamp := time.Now().Format("20060102_15.04.05")
	downloadsDir := filepath.Join(cwd, "Downloads", timestamp)

	if err := os.MkdirAll(downloadsDir, os.ModePerm); err != nil {
		return "", err
	}

	return downloadsDir, nil
}
