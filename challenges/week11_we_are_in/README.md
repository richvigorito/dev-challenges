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

- 🧠 Inference from [last week’s challenge](../week10_xor_ftw)
- ☕ And some cryptic desk remnants: a π mug, a worn copy of Hitchhiker’s Guide, and a note: “Et tu, Brute?”
- 🧾 The vibe coder's commit history:

```bash
a1f4fcd  chore: initial commit - HTML looks good!
b9d12de  feat: added basic security layer (chatgpt said XOR is fine)
3e8c23a  fix: XOR encryption now works with ANY key not just ... the meaning of life 😎
fa7d831  feat: added enc1.bin (pi-inspired encryption lol)
58d21a7  feat: added enc2.bin (og xor ver, keeping it simple)
de6b109  feat: added enc3.py (still counts as encrypted, right?)
ed4d2fe  docs: added README with encryption vibe
92cf899  test: decrypt script works locally, just gotta remember the key 🤔
c7f19d3  style: renamed story.txt to enc1.bin because its *technically* encoded
e4e2b3a  refactor: switched from literal pi to "pi-ish" encryption
ab1fe67  fix: remembered THE actual the answer to EVERYTHING 🔐
82cd7f8  feat: used ceasar shift on .py file because chatgpt said its OG crypto
d48f02c  misc: add my story - too good to delete (hope they dont read it)
fb2a8d3  fix: changed encoding method mid-file... maybe a bad idea? 😅
aa9cc88  docs: all secure now -- vibe lock complete 🔐✨
```

---

## 🎯 Your Goal

As a team guess at what clues the vibe coder left behind and which encryption methods/keys he used.  
Divide and conquer the decryption attempt tasks. Decrypt the files and try to reconstruct the original plaintext.  

---

## 💬 Discussion Points

- What clues would help a real attacker?
- Could the script that cracks it be written faster?
- What would you tell the intern who did this?

--- 
## 🕵️ In conclusion
This challenge might feel a little too easy — the clues are practically waving at you. But reality check: even the simplest encryption gets botched out there.

📉 Case in point: Many malware and shady apps use XOR to “encrypt” confidential data — like service names, configurations, or payloads — often with hardcoded keys. The typical problem/pattern:
- One-byte XOR keys
- Repeats across the data
- No real entropy
- Looks like encryption, but in reality is just obfuscation

### SEE
[XOR and Malware](https://isc.sans.edu/diary/Malware%2Band%2BXOR%2BPart%2B1/22486), ["XOR" encryption](https://cybergibbons.com/security-2/why-xor-alone-is-an-incredibly-bad-encryption-technique) and the [percona bug](https://perconadev.atlassian.net/browse/PT-1703) I helped file. 

The moral? Obfuscation isn't encryption — and in the real world, lazy implementations are still being cracked by amateurs.

