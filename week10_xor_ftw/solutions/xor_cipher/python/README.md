# 🐍XOR File Encryption

---

## 🚀 How It Works

This Python script takes:

1. A **key file** (used to encrypt or decrypt),
2. An **input file** (the plaintext or ciphertext), and
3. An **output file** (where to write the result).

It reads the bytes from the key and input file, then XORs each byte of the input with the corresponding byte of the key (cycling the key if it's shorter). The result is written to the output file.

Because XOR is symmetric, running the same operation again with the same key will decrypt the data.

---

## ▶️ How to Run

```bash
# Encrypt a file
python3 xor_encr.py path/to/key_file path/to/plaintext_file output_encrypted_file

# Decrypt the file back using the same key
python3 xor_encr.py path/to/key_file output_encrypted_file decrypted_output_file

