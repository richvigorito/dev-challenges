# 📚 Golang Examples

Two Go solutions to the [week 17 scraping challenge](../README.md): the same scraper written once as a straight-line loop and once with goroutines. Both use `github.com/gocolly/colly/v2` (pinned in `go.mod`) to visit pages 1–10 of [Books to Scrape](https://books.toscrape.com), pull every `article.product_pod img`, and save the images into a timestamped `Downloads/YYYYMMDD_HH.MM.SS` folder.

## **The Shared Approach**
- A base `colly.Collector` is created with `colly.AllowedDomains("books.toscrape.com")` and cloned for every page, so each page gets its own set of callbacks.
- `OnRequest` prints the `Visiting: ...` line, `OnHTML("article.product_pod img")` resolves the image URL and builds the filename, and `OnError` logs failures.
- Filenames are `<page>_<image-hash>_<clean-alt-text><ext>` — the alt text has spaces removed and everything outside letters, numbers, and `_` stripped by a regex — which keeps files from different pages from colliding.
- `downloadImage` is the same in both versions: `http.Get`, `os.Create`, then `io.Copy` to disk.
- A timestamped downloads folder is created under the current working directory, so each run writes to its own directory.

## **Sequential — `seq/scrape.go`**
The straightforward version: loop `for i := range 10`, clone the collector, register callbacks, and call `clone.Visit(pageURL)`. The loop doesn't move on until the current page and all of its image downloads are finished, so the `Visiting:` lines appear in perfect page order. It ends with `Done! Files saved to: <path>` and the total elapsed time.

Worth noting: the file still contains the commented-out experiment (`sync` import, `sync.WaitGroup`, `wg.Add(1)`, and the `go func(...)` wrapper). It's the before/after of the concurrency rewrite left in place on purpose — you can see exactly which lines had to change to turn the loop async.

## **Async — `async/scrape.go`**
This one pulls the page setup into a small `SiteScraper` / `Page` model:
- `NewSiteScraper(c)` holds the base collector and a list of pages; `addPage(url)` appends a `Page` with its own `Collector.Clone()`.
- `Page.Scrape` does the actual visit and download work, and records its own `TimeElapsed` with a deferred `time.Since(start)`.
- `SiteScraper.Scrape` starts one goroutine per page, tracked by a `sync.WaitGroup`, and gates them with `sem := make(chan struct{}, 10)` so at most 10 pages are in flight at once. The `wg.Wait()` is what makes the final per-page summary safe to print.
- Because the goroutines race, output order is not page order. The `Visiting:` lines come out scrambled (page 10 before page 5, etc.), and the summary is printed only after everything finishes.

The concurrency here is mostly about latency: each page spends ~3 seconds downloading 20 images, and those waits overlap instead of stacking up. The semaphore is polite scraping insurance — the same 10-request cap either way, just concurrent instead of serial.

## **The Runs**

### Async (`go run async/scrape.go`)
```bash
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-10.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-5.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-7.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-6.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-2.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-8.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-1.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-4.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-3.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-9.html
Page: https://books.toscrape.com/catalogue/category/books_1/page-1.html | Images: 20 | Took: 3.014385666s
Page: https://books.toscrape.com/catalogue/category/books_1/page-2.html | Images: 20 | Took: 3.073601333s
Page: https://books.toscrape.com/catalogue/category/books_1/page-3.html | Images: 20 | Took: 3.010666959s
Page: https://books.toscrape.com/catalogue/category/books_1/page-4.html | Images: 20 | Took: 3.006400083s
Page: https://books.toscrape.com/catalogue/category/books_1/page-5.html | Images: 20 | Took: 3.011839s
Page: https://books.toscrape.com/catalogue/category/books_1/page-6.html | Images: 20 | Took: 3.1213345s
Page: https://books.toscrape.com/catalogue/category/books_1/page-7.html | Images: 20 | Took: 3.01162525s
Page: https://books.toscrape.com/catalogue/category/books_1/page-8.html | Images: 20 | Took: 3.090640334s
Page: https://books.toscrape.com/catalogue/category/books_1/page-9.html | Images: 20 | Took: 3.072849292s
Page: https://books.toscrape.com/catalogue/category/books_1/page-10.html | Images: 20 | Took: 3.074379375s


------------------
Total Elapsed time: 3.122519875s
```

### Sequential (`go run seq/scrape.go`)
```bash
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-1.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-2.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-3.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-4.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-5.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-6.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-7.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-8.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-9.html
Visiting: https://books.toscrape.com/catalogue/category/books_1/page-10.html
Done! Files saved to: /Users/richvigorito/Development/tutorials/dev-challenges/challenges/week17_page_peelers/solutions/go/Downloads/20261123_22.58.21


------------------
Total Elapsed time: 21.176768291s
```

## **What I Learned**
- Same work, same 200 images (20 per page), wildly different wall clock: **21.17s sequential vs 3.12s async** — roughly **7x faster** for a handful of extra lines of `sync` plumbing.
- Each async page still took ~3 seconds on its own; the win is that all ten 3-second waits happened at the same time. Total time tracks the slowest page, not the sum of all pages.
- Orderly console output is a casualty of concurrency. The sequential run reads like a tidy log; the async run looks chaotic, even though every page finished correctly.
- Cloning the collector per page matters in both versions — it keeps each page's callbacks and state independent, which is what makes the concurrent version safe to fan out.
- This is the "download asynchronously" improvement from the [interview retrospective](../README.md) in actual Go code, minus the HTML hashing/duplication checks — those would be the next layer if the site changed mid-run again.

## **Final Thoughts**
The sequential version is the one you write first (and the comments show it), and it's perfectly correct. The async version is the one you write when 21 seconds becomes 3 seconds. Nothing about the scraping logic changed — only how the waiting is organized. That's a pretty good demonstration of where concurrency actually pays off: not in making each download faster, but in not making you wait for them one at a time.
