# 📚 Interview Question

As mentioned in [README](../README.md), this challenge was inspired by a real interview question I recently had. Out of respect for the company, I will not share the exact question, the site used, or the language required. The site here is different, some aspects of the scraping are different, and the implementation language is different. However, I’ll share the general idea, my approach, why my solution was rejected, and what I learned.


## **Interview Task** 
- Given 40 minutes to complete the task
- Scrape a site from 1-10 pages deep 
- Download all images from all pages
- Save the images to a folder

## **Solution**
I won’t share the original code, but here’s the high-level pseudocode:

### Pseudo Code
```bash
FOR i IN 1 TO 10
    GET https://example.com/page/i
    PARSE HTML
    FIND ALL IMAGE TAGS
    FOR EACH IMAGE TAG
        GET IMAGE URL
        DOWNLOAD IMAGE TO FOLDER
    END FOR
END FOR
```
### **What Went Well**
- I thought it would be faster writing images to a file then via bash read each line downloading the file via curl. Part way through the bash script the interviewer notified me the solution needed to be the same programming language.
- After that little detour I had a working solution by the ~30 minute mark.
- The language was not one I’m as comfortable with (compared to PHP), slowed me down a little but not too bad.
- I knew each page had 16 images, and my naming convention was `image-$pageNum-$imageNum.jpg`.
- The script downloaded all images from the first 10 pages and the counts matched expectations.

### **What Didn’t Go Well**
While reviewing the results, I noticed something odd:
- The **last image downloaded from page 10** did not match the **last image shown in my browser** for that page.
- Counts still matched, but the final image differed.

When I tested with fewer pages (1–2 or 1–5), results were correct. The mismatch only occurred when scraping all 10 pages. I frantically was comparing the dom as if for some bizarre reason there might of been something special about page 10. Ultimately I couldn’t figure out the cause in the remaining 10 minutes and at the 40 minute mark the interviewer ended the exercise. The next day, I was told they would not be moving forward with my candidacy.

## **Post-Interview Debugging**

### During the Interview
- I had a browser tab open on page 10 from early in the exercise.
- I compared the last image on that tab to my downloaded files.
- Without refreshing the browser, I concluded they didn’t match.

### After the Interview
1. Copied the original code, downloaded images, and logs into a new workspace to avoid altering the originals.
2. Ran the script again — this time the mismatch didn’t occur. The last image downloaded matched the last image on page 10.
3. Compared MD5 hashes of the images from the interview run to the new run. Six new images had been added since the interview, so my comparason tool just offset the comparison window by 6; easy enough. 
4. Analysis of the interview log showed:
    - At the time, page 8 was missing an image compared to its current state.
    - The last image on page 8 (“image-ABC”) was also the **first** image on page 9.
    - This duplication shifted the sequence, causing downstream differences. My log file from the interview showed as much, as the output was in the format of:

```bash
> preparing to download images 1,3,4 ... ABC  from page 8
> ----- downloaded image 1
> ----- downloaded image 2
> ----- downloaded image 3
> ...
> ----- downloaded image ABC
>
> preparing to download images ABC,x,y...  from page 9
> ----- downloaded image ABC
> ----- downloaded x
> ...
```
---

**Conclusion:**  
It appears the site was updated *while my script was running*. By the time my scraper moved from page 8 to page 9, the missing image had been inserted, altering the content and order.

Had I refreshed the browser tab for page 10 during the interview, I would have seen that the on-page content had changed, matching my downloaded results. That likely would have clarified the issue to the interviewer. And who knows but probably would of been asked to the final round of interviews.  🤦

## **What I Could Have Done Differently**
- **During the interview:** Obviously refreshing the browser to verify discrepancies in real time would of basically ended the exercise on time 🤦
- **In code:** Make the scraper more robust against mid-run changes by:
    - Gathering all image URLs and hashing page HTML **before** any downloads.
    - Downloading asynchronously to minimize time between page fetches.
    - Re-hashing pages after downloads and comparing to detect changes.
    - Checking for duplicate image URLs across pages.
      
##### Improved Pseudo Code
```bash
function parse():
  FOR i IN 1 TO 10
      GET https://example.com/page/i
      PARSE HTML
      FIND ALL IMAGE TAGS
      HASH PAGE SOURCE
      return HASH, IMG_TAGS

hashes, images = parse()
async_download(images)
after_hashes, _ = parse()

compareHashes(hashes, after_hashes)
detectDuplicates(images)
```
The complete/improved can be see at [here: scrape.py](scrape.py)

## **Final Thoughts**
Did I have a correct, working solution? Yes.  
Should it have counted? man I would think so but I can see both sides.

It’s possible the interviewer didn’t notice the site update either, or the exercise was intended to see if I could handle changes and duplicates. The likelihood of this exact situation happening during an interview is extremely low but also these guys do a lot of this work so it's possible they were looking for more robust solutions even if did refresh the page and submitting the working solution. 

Lastly, talking out what you're doing, as distracting as that can be probably would of went a long way in this instance. I was so stressed trying to find the difference that if I paused and said "that's so weird, wonder why this last image is different" he may of recognized that this has happened and other interviews and kindly suggested 'hey refresh the browser tab.'
