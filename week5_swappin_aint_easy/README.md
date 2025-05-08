# 🏆 Week [5] - Swappin aint easy

## 📝 Challenge Overview  
Sharpen your cross-language skills with a deceptively simple task: **write a working swap function and call it** in as many languages as you can in 10–15 minutes!

This challenge is inspired by a real-world PHP interview we conducted at previous job — the question was simple:  
> **"In PHP, write a function that takes two arguments and swaps their values. Then show how you'd call it."**  
Surprisingly, this stumped a number of candidates and turned out to be a solid way to dig into deeper fundamentals during interviews.

You'd be surprised how different (or tricky) this ended up being for many. 

---

## 🏁 Challenge Format:  
**Head-to-Head Speed Round** 🔁⏱  
Pick a time, like **10 or 20 minutes** to write as many **working** swap implementations as possible in as many different programming languages.  🏅 You can submit **multiple approaches per language** 

---

### 📋 Requirements & Specs

- 🧠 Implement a function that takes two values and returns (or updates) them swapped.
- ✅ Each solution must be **executable** and **print before/after values**.
- 💬 Print to console so we can see actual swap behavior.
- 🌍 Choose any language — mainstream or obscure — as long as it runs.

---

\## 🎯 Bonus Ideas

- 🌐 Implement in a lesser-known language (e.g. Erlang, Haskell, or Clojure).
- 🤹 Discuss how mutability and scope rules change the problem across paradigms.
- 🧪 Go to solutions dir pick a solution file and create an alternative approach


---

## 🛠 Solutions Available:
In the solutions directory you'll find an array of different languages for your enjoyment 
I recommend starting before challenge, this takes about 5 mins to build due to all the supported languages. 
```bash
$> docker build -t swapbox .
$> docker run -it --rm -v $(pwd):/workspace swapbox
$> bash run_all.sh
```
> Disclaimer: most challenges i try to do on my own for fun, gauge if its gonna take too long for a team or race format
>             and get some practice in languages i done normally program in. This one i wanted to have show a wide a array 
>             examples. Clojure, fortrain, lisp, haskell, rust, scala and erlang were credit to chatgpt (fwiw, all other erlang 
>             code in this repo is my work)
