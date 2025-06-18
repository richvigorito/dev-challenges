# 💻 Week 11 Challenge: *We're In*

You’ve seen the movies. The green text. The sunglasses at night. The “we’re in.”

Well this week, you actually are.

---

A *“vibe coder”* was tasked with “securing the website.”  
He misunderstood HTTPS and thought encrypting static files was “the real security.”  
Armed only with this newsletter and ChatGPT, he cobbled together a couple ciphers from last week’s challenge.

He was promptly fired.

But not before leaving behind **3 encrypted files** and a trail of questionable implementation choices.

---

## 🕵️ The Challenge

Reverse-engineer and **crack the encrypted files** using the clues left behind by the vibe coder:

- 🧠 Inference from [last week’s challenge](https://github.com/richvigorito/dev-challenges/tree/main/week10_xor_ftw)
- 🧾 The vibe coder's commit history:

```bash
a1f4fcd  chore: initial commit - HTML looks good!
b9d12de  feat: added basic security layer (chatgpt said XOR is fine)
3e8c23a  fix: XOR encryption now works with ANY key not just 42 😎
fa7d831  feat: added enc1.bin (pi-inspired encryption lol)
58d21a7  feat: added enc2.bin (og xor ver, keeping it simple)
de6b109  feat: added enc3.py (still counts as encrypted, right?)
ed4d2fe  docs: added README with encryption vibe
92cf899  test: decrypt script works locally, just gotta remember the key 🤔
c7f19d3  style: renamed story.txt to enc1.bin because its *technically* encoded
e4e2b3a  refactor: switched from literal pi to "pi-ish" XOR
ab1fe67  fix: remembered THE actual the answer to EVERYTHING 🔐
82cd7f8  feat: used ceasar shift on .py file because chatgpt said its OG crypto
d48f02c  misc: added fanfic - too good to delete (hope they dont read it)
fb2a8d3  fix: changed encoding method mid-file... maybe a bad idea? 😅
aa9cc88  docs: all secure now -- vibe lock complete 🔐✨
```

---

## 🎯 Your Goal

You’ve got 20–30 minutes.  
Decrypt the files. Try to reconstruct the original plaintext.  
Was the encryption secure? What assumptions did the coder make? What went wrong?

---

## 💬 Bonus Prompts

- What clues would help a real attacker?
- Can you write a script that cracks it faster?
- What would you tell the intern who did this?

