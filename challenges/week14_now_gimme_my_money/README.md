## 💲 Strategy Pattern: Wheres my money?

This week's challenge builds off the ideas in **last week’s Pascal deep dive**, where we cracked open *Algorithms + Data Structures = Programs*. Chapter 1 walked us through the fundamentals: integers, characters, floating point numbers, arrays, and "records" (think: early objects/structs); including floating point representation, the pitfalls of precision and cool algorithms like [negative powers of two](https://github.com/richvigorito/the-best-programming-book-ever-written/tree/main/src/chapters/1_fundamental_data_structures/negative_power_of_2).

Now we’re zooming in on **floating point math**, particularly when summing money — because nothing sparks a heated Slack thread like rounding errors in a banking system.

### 🎯 The Scenario:
You’ve inherited an invoicing system with a pluggable `SumModule` component. The team is divided:

- Should we sum values **as-is with floats**?
- Should we **convert to cents** and avoid FP altogether?
- Would fancy algorithms like [Kahan summation](https://www.geeksforgeeks.org/dsa/kahan-summation-algorithm/), [improved Neumaier version](https://en.wikipedia.org/wiki/Kahan_summation_algorithm#Further_enhancements) or a language specific package/datatype that uses [arbitray precision](https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic) like ([go big](https://pkg.go.dev/math/big), [php bcmath](https://www.php.net/manual/en/book.bc.php), [python decimal module](https://docs.python.org/3/library/decimal.html), etc) to reduce errors 'enough'?

Your task: implement as many versions and compare!

---

## 🧪 [Strategy Pattern](https://refactoring.guru/design-patterns/strategy) in Action

In addition to playing with floating point precision, this challenge is a great way to practice the **Strategy Pattern**:

> Define a family of algorithms, encapsulate each one, and make them interchangeable without modifying the client code.

Each summation style is a *strategy*. Your invoicing system shouldn't care which one it uses — just that it implements the right interface.

```python
class SumModule:
    def compute(self, amounts: List[float]) -> float:
        pass
```

Swap in different modules like:

```python
total = KahanSum().compute(amounts)
```

Why does this matter? Because clean, modular design keeps you from rewriting your logic every time your team changes its mind about how to count money (which, let’s be honest, is inevitable).

---

\## 🎯 Bonus Ideas
Try writing a test case that highlights the differences between the three methods. The naive sum might surprise you.


## 🛠 Solutions Available:
In the solutions directory you'll find an array of different languages for your enjoyment.
