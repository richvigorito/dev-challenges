# 🔐 XOR File Encryption (Go Version)

## 📝 Overview

This Go program demonstrates XOR encryption using a randomly generated one-time pad key. It reads a file, generates a random key of equal length, performs XOR on each byte, and outputs:

- `encr.txt`: the encrypted file
- `encr_key`: the random key
- `decrypted.md`: the decrypted result (should match the original input file)

## 📂 Files & Output

- **encr.txt**: XOR-encrypted contents of the input file
- **encr_key**: the one-time pad key (randomly generated, same length as the input)
- **decrypted.md**: result of XOR-decrypting the `encr.txt` with the key

## ⚙️ How It Works

1. The input file (`../../README.md`) is opened and read into memory.
2. A cryptographically secure random key is generated using `crypto/rand`. Its size matches the input file's size.
3. Each byte in the file is XOR'd with the corresponding byte in the key.
4. The encrypted output (`encr.txt`) and the key (`encr_key`) are saved.
5. For verification, the program XORs the encrypted data with the key to produce the decrypted file (`decrypted.md`).

## 🧠 Why Key Length Matters

Using a key that matches the file length:
- Makes this a **one-time pad** encryption, which is theoretically unbreakable if the key is truly random, used once, and kept secret.
- Ensures every byte is uniquely masked, improving entropy and making patterns impossible to detect.

Shorter keys reused across data would introduce patterns and make the encryption much weaker.

## ▶️ How to Run

Just run the Go file:
``` bash 
$ go run xor_encr.go
```

