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
	"time"

	"github.com/gocolly/colly/v2"
)

var safeCharsRegex = regexp.MustCompile(`[^a-zA-Z0-9_]+`)

func GetDownloadsFolder() (string, error) {
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

func main() {
	start := time.Now()
	downloadsDir, err := GetDownloadsFolder()
	if err != nil {
		log.Fatal(err)
	}

	baseCollector := colly.NewCollector(
		colly.AllowedDomains("books.toscrape.com"),
	)

	for i := range 10 {
		pageNum := i + 1
		pageURL := fmt.Sprintf("https://books.toscrape.com/catalogue/category/books_1/page-%d.html", pageNum)

		clone := baseCollector.Clone()
		clone.OnRequest(func(r *colly.Request) {
			fmt.Println("Visiting:", r.URL.String())
		})

		clone.OnHTML("article.product_pod img", func(e *colly.HTMLElement) {
			relSrc := e.Attr("src")
			fullImgURL := e.Request.AbsoluteURL(relSrc)
			altText := e.Attr("alt")

			origBase := filepath.Base(fullImgURL)
			ext := filepath.Ext(origBase)
			hash := strings.TrimSuffix(origBase, ext)

			cleanTitle := strings.ReplaceAll(altText, " ", "")
			cleanTitle = safeCharsRegex.ReplaceAllString(cleanTitle, "")

			fileName := fmt.Sprintf("%d_%s_%s%s", pageNum, hash, cleanTitle, ext)

			if err := downloadImage(fullImgURL, downloadsDir, fileName); err != nil {
				log.Println("Failed to download:", err)
			}
		})

		clone.OnError(func(r *colly.Response, err error) {
			log.Println("Request URL:", r.Request.URL, "failed with error:", err)
		})

		if err := clone.Visit(pageURL); err != nil {
			log.Println("Visit failed:", err)
		}
	}

	fmt.Println("Done! Files saved to:", downloadsDir)

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
