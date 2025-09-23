from decimal import Decimal, getcontext
import random

# Increase precision
getcontext().prec = 50

class SumEngine:
    def compute(self, amounts):
        raise NotImplementedError()

class PennyEngine(SumEngine):
    def compute(self, amounts):
        steps = []
        total_pennies = 0
        for amount in amounts:
            total_pennies += int(Decimal(amount) * 100)
            steps.append(Decimal(total_pennies) / 100)
        return steps, Decimal(total_pennies) / 100

class FloatMathEngine(SumEngine):
    def compute(self, amounts):
        steps = []
        total = 0.0
        for amount in amounts:
            total += float(amount)
            steps.append(total)
        return steps, total

class KahanEngine(SumEngine):
    def compute(self, amounts):
        steps = []
        total = 0.0
        c = 0.0
        for amount in amounts:
            y = float(amount) - c
            t = total + y
            c = (t - total) - y
            total = t
            steps.append(total)
        return steps, total

class NeumaierEngine(SumEngine):
    def compute(self, amounts):
        steps = []
        sum_ = 0.0
        c = 0.0
        for x in amounts:
            t = sum_ + float(x)
            if abs(sum_) >= abs(float(x)):
                c += (sum_ - t) + float(x)
            else:
                c += (float(x) - t) + sum_
            sum_ = t
            steps.append(sum_ + c)
        return steps, sum_ + c

class BigDecimalEngine(SumEngine):
    def compute(self, amounts):
        steps = []
        total = Decimal('0')
        for amount in amounts:
            total += Decimal(amount)
            steps.append(total)
        return steps, total

def get_values(n):
    min_cents = 50  # $0.50
    max_cents = 200  # $2.00
    return [Decimal(random.randint(min_cents, max_cents)) / 100 for _ in range(n)]

# Run simulation
n = 5000000  # You can bump this up to match Go's 5 million for full comparison
values = get_values(n)

engines = [
    ("PennyEngine", PennyEngine()),
    ("FloatMathEngine", FloatMathEngine()),
    ("KahanEngine", KahanEngine()),
    ("NeumaierEngine", NeumaierEngine()),
    ("BigDecimalEngine", BigDecimalEngine()),
]

results = {}
finals = {}

for name, engine in engines:
    steps, total = engine.compute(values)
    results[name] = steps
    finals[name] = total
    print(f"Total using {name}: {total:.12f}")

