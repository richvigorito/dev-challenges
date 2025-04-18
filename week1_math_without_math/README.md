# Dev Challenge 001 - Arithmetic From Scratch

Implement a basic arithmetic library **using recursion and bitwise operations only** — no `+`, `-`, `*`, `/`, `%`, or built-in math functions allowed!

This is a great warm-up for teams to stretch their problem-solving muscles and think about how computation really works under the hood.

---

## 💡 The Challenge

Implement the following functions using only recursion and bitwise operations (e.g. `<<`, `>>`, `&`, `|`, `^`, `~`):

- `incr(n)` – Increment
- `decr(n)` – Decrement
- `add(a, b)` – Addition
- `sub(a, b)` – Subtraction
- `mult(a, b)` – Multiplication
- `div(a, b)` – Integer Division (truncate toward zero)
- `modulo(a, b)` – Modulus (remainder after division)
- `fact(n)` – Factorial
- `exponent(a, b)` – Exponentiation (`a` to the power of `b`)
- `quotient(a, b)` – Alias for `div(a, b)` (quotient = result of division without the remainder)

### 🔧 Requirements

- You may use `0` and `1` as base values.
- You may use bitwise operations and recursion only.
- No usage of `+`, `-`, `*`, `/`, `%`, `math` module, etc.

---

## 📁 Structure

- `challenge.py` – Write your solution here
- `solution.hs` – Reference solution in Haskell (don't peek too soon!)
- `test_cases.py` – Some test cases to validate your implementation

---

## 🚀 Getting Started

```bash
git clone https://github.com/richvigorito/dev-challenges.git
cd dev-challenges/challenge-001
python test_cases.py

