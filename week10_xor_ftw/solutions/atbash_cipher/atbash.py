# https://en.wikipedia.org/wiki/Atbash

upper_case_hash_table = {'A' : 'Z', 'B' : 'Y', 'C' : 'X', 'D' : 'W', 'E' : 'V',
        'F' : 'U', 'G' : 'T', 'H' : 'S', 'I' : 'R', 'J' : 'Q',
        'K' : 'P', 'L' : 'O', 'M' : 'N', 'N' : 'M', 'O' : 'L',
        'P' : 'K', 'Q' : 'J', 'R' : 'I', 'S' : 'H', 'T' : 'G',
        'U' : 'F', 'V' : 'E', 'W' : 'D', 'X' : 'C', 'Y' : 'B', 'Z' : 'A'}

lookup_table = {}

for k, v in upper_case_hash_table.items():
    lookup_table[k] = v      
    lookup_table[k.lower()] = v.lower()   

def atbash(message):
    cipher = ''
    for letter in message:
        if(letter != ' '):
            cipher += lookup_table[letter]
        else:
            cipher += ' '

    return cipher

def main():
    message = 'What is hateful to you, do not do to others'  # old hebrew saying, atbash is  
    AlephTawBetShin = atbash(message)                        # first, last, second and second 
                                                             # to last letters of hebrew alphabet
    print(AlephTawBetShin)
    
    decoded = atbash(AlephTawBetShin)
    print(decoded)


# Executes the main function
if __name__ == '__main__':
    main()
