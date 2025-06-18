import sys
import os

def read_binary_to_bytearray(filepath):
    if not os.path.exists(filepath):
        print(f"[ERROR] File not found: {filepath}", file=sys.stderr)
        return None

    if os.path.getsize(filepath) == 0:
        print(f"[ERROR] File is empty: {filepath}", file=sys.stderr)
        return None

    try:
        with open(filepath, 'rb') as file:
            key = bytearray(file.read())
            while key and key[-1] in (10, 13):  # remove trailing \n or \r
                key.pop()
        return key
    except Exception as e:
        print(f"[ERROR] Couldn't read file {filepath}: {e}", file=sys.stderr)
        return None

def safe_chr(b):
    return chr(b) if 32 <= b <= 126 else '.'

def print_hex_preview(label, data, maxlen=32):
    maxlen=850
    print(f"[INFO] {label} preview (hex + ASCII):", file=sys.stderr)
    for i in range(0, min(len(data), maxlen)):
        print(f"{i:02}: {data[i]:02x} ({safe_chr(data[i])})", file=sys.stderr)
    #if len(data) > maxlen:
    #    print(f"... (truncated preview of {len(data)} bytes)", file=sys.stderr)
    print("", file=sys.stderr)

# === Main ===

if len(sys.argv) != 3:
    print("Usage: python xor_decrypt.py <keyfile> <inputfile>", file=sys.stderr)
    sys.exit(1)

key_file = sys.argv[1]
input_file = sys.argv[2]

encryption_key = read_binary_to_bytearray(key_file)
file_data = read_binary_to_bytearray(input_file)

if encryption_key is None or file_data is None:
    print("[FATAL] Aborting due to missing or invalid files.", file=sys.stderr)
    sys.exit(1)

#print_hex_preview("Key", encryption_key)
#print_hex_preview("Input", file_data)

# XOR decryption
key_len = len(encryption_key)
output_data = bytearray(len(file_data))

for i in range(len(file_data)):
    input_byte = file_data[i]
    key_byte = encryption_key[i % key_len]
    result_byte = input_byte ^ key_byte
    print(f"{i:04}: {input_byte:02x} ^ {key_byte:02x} = {result_byte:02x} ({safe_chr(result_byte)})", file=sys.stderr)
    output_data[i] = result_byte

# Try to decode as UTF-8 first
try:
    print(output_data.decode("utf-8"), end="")  # don't add extra newline
except UnicodeDecodeError as e:
    print("[WARN] Output is not valid UTF-8.", file=sys.stderr)
    print(f"[ERROR] UnicodeDecodeError: {e}", file=sys.stderr)

    # Show byte and context
    start = max(0, e.start - 5)
    end = min(len(output_data), e.end + 5)
    print(f"[DEBUG] Problematic byte range [{e.start}:{e.end}]:", file=sys.stderr)

    for i in range(start, end):
        b = output_data[i]
        marker = "<--" if e.start <= i < e.end else "   "
        print(f"{i:04}: 0x{b:02x} ({safe_chr(b)}) {marker}", file=sys.stderr)

    print("\n[INFO] Use a different key or confirm file encoding.", file=sys.stderr)

