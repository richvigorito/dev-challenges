# XOR File Encryption — C++ Solution

This program implements simple XOR encryption/decryption in C++ ,exactly the like the python solution. It reads a file, XORs it with a key of the same length, and writes the result to an output file. Running the program twice (with the same key) decrypts the file back to its original content.

---

### How to Build

    g++ xor_encr.cpp -o xor

---

### How to Use

    ./xor <key_file> <input_file> <output_file>

Example usage:

    # Encrypt:
    ./xor encryption_key ../../README.md encr.bin

    # Decrypt:
    ./xor encryption_key encr.bin decrypted.md

    # Verify:
    diff decrypted.md ../../README.md  # should output nothing if decryption worked

---

### Design Details

- **Key length = file length**: For a one-time pad style XOR cipher, the key must be the same length as the input to achieve proper encryption/decryption symmetry.
- **Binary-safe**: All files are read and written in binary mode (`std::ios::binary`) so non-text data and emojis are preserved accurately.

