import sys

def ceaser(text: str, offset: int) -> str:
    decrypted = ""

    for i in range(len(text)):
        if text[i].isupper():
            decrypted += chr((ord(text[i]) - ord('A') - offset) % 26 + ord('A'))
        elif text[i].islower():
            decrypted += chr((ord(text[i]) - ord('a') - offset) % 26 + ord('a'))
        else:
            decrypted += text[i]  # keep punctuation, spaces, etc.
    return decrypted

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 ceasar.py <input_file> <offset>")
        sys.exit(1)

    filename = sys.argv[1]
    offset = int(sys.argv[2])

    try:
        with open(filename, "r") as f:
            text = f.read()
    except FileNotFoundError:
        print(f"File '{filename}' not found.")
        sys.exit(1)

    decrypted_text = ceaser(text, offset)
    print(decrypted_text)

if __name__ == "__main__":
    main()
