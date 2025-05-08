def swap(a, b):
    return b, a

def main():
    a, b = 1, 2
    print(f"Before: a={a}, b={b}")
    a, b = swap(a, b)
    print(f"After: a={a}, b={b}")

if __name__ == "__main__":
    main()
