# 🔐 Week [10] - XOR FTW

## 📝 Challenge Overview  
Become a **bitwise wizard** — or maybe just the **cipher apprentice** your team never asked for — by implementing a dead-simple, kinda-janky, yet surprisingly effective encryption tool using the classic **XOR cipher**.

Your mission: build a command-line utility that can **encrypt and decrypt any file** using a user-provided key. You’ll wrangle bytes, poke at file pointers, and remember why C still gets invited to the party.

---

## 🏁 Challenge Format  
**Solo or Head-to-Head** ⚔️  
You’ve got 20–30 minutes. Build it. Run it. Encrypt something. Decrypt it. Then swap war stories.

---

## 🤔 But Seriously, Why?

"Why even bother? Frameworks exist. I could just Google it."

Fair. But also:

- Who *writes* those frameworks?
- Why does anyone do anything anyways?
- How does encryption actually work under the hood?
- It could just help you find a bug deep in a library?

> 🧪 Exhibit A: [Percona bug PT-1703](https://perconadev.atlassian.net/browse/PT-1703)
> A colleague and I reported a **real-world production issue** where CRC32 checksums failed to catch mismatches — because **XORing blocks doesn’t play nice with CRC**.
> (See [CRC32 caveats](https://en.wikipedia.org/wiki/Cyclic_redundancy_check) — it’s not associative over XOR.)
> Understanding these edge cases isn’t just trivia — it helps you debug, design better systems, and avoid silent data corruption.

Also… **XOR FTW**, obviously.

---

## 🎯 Bonus Challenges

- 🏛 Implement a **Caesar cipher**, **Atbash**, or **Book cipher**
- 🔐 Try **AES**, **DES**, or **RSA** (even just conceptually — discuss as a team)
- 📁 Support binary files (not just plain text: try PNG, PDF, etc)
- 🧪 Compare outputs and discuss entropy or detectability

---

## 📋 Requirements & Specs

- 🔐 Encrypt a file using XOR and a user-provided string key.
- 🔓 Decrypt using the same tool and key (symmetry FTW).
- 📂 Accept filenames and key via command line.
- 🚫 No external libraries — do it raw.

---

## 💡 Example Usage

```bash
# Encrypt a file
./xorcrypt input.txt encrypted.bin "mysecret"

# Decrypt it back
./xorcrypt encrypted.bin decrypted.txt "mysecret"
```

---
> 🧠 Next week’s follow-up: We’ll trade ciphertexts and **try to break each other’s ciphers**. Ready your tinfoil hats.

