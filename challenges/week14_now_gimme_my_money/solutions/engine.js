function getValues(n) {
  const min = 50; // in cents
  const max = 200;
  const values = [];
  for (let i = 0; i < n; i++) {
    const cents = Math.floor(Math.random() * (max - min + 1)) + min;
    values.push(cents / 100.0);
  }
  return values;
}

// Penny-style accumulation
function pennyEngine(values) {
  let totalPennies = 0;
  for (let val of values) {
    totalPennies += Math.round(val * 100); // safer than implicit cast
  }
  return totalPennies / 100.0;
}

// Basic float sum
function floatMathEngine(values) {
  return values.reduce((acc, v) => acc + v, 0);
}

// Kahan Summation
function kahanEngine(values) {
  let sum = 0.0;
  let c = 0.0;
  for (let v of values) {
    let y = v - c;
    let t = sum + y;
    c = (t - sum) - y;
    sum = t;
  }
  return sum;
}

// Neumaier Summation
function neumaierEngine(values) {
  let sum = 0.0;
  let c = 0.0;
  for (let v of values) {
    let t = sum + v;
    if (Math.abs(sum) >= Math.abs(v)) {
      c += (sum - t) + v;
    } else {
      c += (v - t) + sum;
    }
    sum = t;
  }
  return sum + c;
}

// Run test
const n = 5_000_000;
const values = getValues(n);

console.log("Total using PennyEngine:       ", pennyEngine(values).toFixed(12));
console.log("Total using FloatMathEngine:  ", floatMathEngine(values).toFixed(12));
console.log("Total using KahanEngine:      ", kahanEngine(values).toFixed(12));
console.log("Total using NeumaierEngine:   ", neumaierEngine(values).toFixed(12));

//  to run:
//  node engine.js
//
