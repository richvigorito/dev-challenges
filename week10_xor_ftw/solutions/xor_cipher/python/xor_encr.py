import sys

def read_binary_to_bytearray(filepath):
    try:
        with open(filepath, 'rb') as file:
            byte_array = bytearray(file.read())
            return byte_array
    except FileNotFoundError:
        print(f"Error: File not found: {filepath}")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if len(sys.argv) != 4:
    print("Usage: python xor_encrypt.py <keyfile> <inputfile> <outputfile>")
    sys.exit(1)

encryption_key = read_binary_to_bytearray(sys.argv[1])
file_data = read_binary_to_bytearray(sys.argv[2])
outfile = sys.argv[3]

if encryption_key is None or file_data is None:
    sys.exit(1)

key_len = len(encryption_key)
output_data = bytearray(len(file_data))

for i in range(len(file_data)):
    output_data[i] = file_data[i] ^ encryption_key[i % key_len]
    print(f"byte: {file_data[i]} ^ {encryption_key[i % key_len]} = {output_data[i]}")  # Debug info

with open(outfile, 'wb') as out:
    out.write(output_data)
