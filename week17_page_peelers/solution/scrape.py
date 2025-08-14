from bs4 import BeautifulSoup
import requests
import os
import hashlib
from typing import Tuple, List
from concurrent.futures import ThreadPoolExecutor
from collections import Counter
from urllib.parse import urljoin
import time
import random
import argparse

BASE_URL = "https://books.toscrape.com"
SAVE_DIR = 'downloads'
os.makedirs(SAVE_DIR, exist_ok=True)

# Track downloaded images to avoid duplicates
downloaded = set()

# Use a session for faster repeated requests
session = requests.Session()

def scrape_page(page_url: str) -> Tuple[str, List[str]]:
    """Fetch a single page, return its HTML hash and list of image URLs."""
    time.sleep(random.uniform(0.5, 1.5))  # polite delay
    response = session.get(page_url)
    if response.status_code != 200:
        print(f"Failed to retrieve page: {page_url}")
        return "", []

    soup = BeautifulSoup(response.text, 'html.parser')

    images = soup.find_all('img')
    image_urls = [urljoin(page_url, img['src']) for img in images if 'src' in img.attrs]

    minified = str(soup).replace('\n', '').replace('\t', '').strip()
    md5_hash = hashlib.md5(minified.encode('utf-8')).hexdigest()
    return md5_hash, image_urls

def download_image(image_url: str, page: int, count: int):
    """Download image if not already downloaded."""
    if image_url in downloaded:
        return
    downloaded.add(image_url)

    try:
        response = session.get(image_url)
        response.raise_for_status()

        ext = os.path.splitext(image_url)[1] or '.jpg'
        filename = f'image_{page}-{count}{ext}'
        filepath = os.path.join(SAVE_DIR, filename)

        with open(filepath, 'wb') as f:
            f.write(response.content)
    except Exception as e:
        print(f'Failed to download {image_url}: {e}')

def iterate_pages(pages: int):
    """Scrape multiple pages and return hashes and image URLs."""
    image_urls = {}
    hashes = {}

    for i in range(1, pages + 1):
        if i == 1:
            page_url = f"{BASE_URL}/index.html"
        else:
            page_url = f"{BASE_URL}/catalogue/page-{i}.html"

        print(f"Scraping page: {page_url}")
        page_hash, page_images = scrape_page(page_url)
        hashes[i] = page_hash
        image_urls[i] = page_images

    return image_urls, hashes

def validate(before_hashes, after_hashes, before_urls):
    """Compare pre/post hashes and check for duplicate images."""
    msg = "Hashes match!" if before_hashes == after_hashes else "Hashes do not match!"
    print(f"** {msg}")

    image_urls_flat = [url for urls in before_urls.values() for url in urls]
    element_counts = Counter(image_urls_flat)
    duplicates = [item for item, count in element_counts.items() if count > 1]
    msg = "No duplicate images found." if not duplicates else f"Duplicate images found: {duplicates}"
    print(f"** {msg}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--pages", type=int, default=10, help="Number of pages to scrape")
    args = parser.parse_args()

    print("Starting web scraping...")
    image_urls, hashes = iterate_pages(args.pages)

    # Download images asynchronously
    with ThreadPoolExecutor(max_workers=10) as executor:
        for page, images in image_urls.items():
            for count, image_url in enumerate(images):
                executor.submit(download_image, image_url, page, count)

    # Light re-scrape for hash validation
    _, post_hashes = iterate_pages(args.pages)

    print("Web scraping completed.")
    print("Starting validation...")
    validate(hashes, post_hashes, image_urls)
    print("Validation completed.")

