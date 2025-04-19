# Dev Challenge 001 - Arithmetic From Scratch

## Objective

Implement a basic arithmetic library using **only recursion and very limited operators** — no `+`, `-`, `*`, `/`, `%`, or built-in math functions allowed!

This is a great warm-up for teams to stretch their problem-solving muscles and think about how computation really works under the hood.

---

## 💡 The Challenge

Using only the following:

- Unary minus (`-x`)
- Auto-increment (`++`)
- Auto-decrement (`--`)

Re-implement core arithmetic operations:

- `add(a, b)` – Addition
- `sub(a, b)` – Subtraction
- `mult(a, b)` – Multiplication
- `div(a, b)` – Integer Division (truncate toward zero)
- `modulo(a, b)` – Modulus (hint: this will help with division)
- `exponent(a, b)` – Exponentiation (`a` to the power of `b`)

---

## 🎯 Bonus

As a stretch goal, **eliminate all use of**:

- Unary minus
- `++` (increment)
- `--` (decrement)

...and instead implement **everything using recursion and bitwise operations only**, such as:

- `<<`, `>>`, `&`, `|`, `^`, `~`

Recreate `incr(n)` and `decr(n)` using pure bitwise logic, and use those to rebuild the other operations.

---

## 📁 Solutions in various langauges in solutions dir
