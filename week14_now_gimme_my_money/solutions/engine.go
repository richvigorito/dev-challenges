package main

import (
	"fmt"
	"math"
	"math/rand"
	"time"
	"math/big"
	"sort"
)

type SumEngine interface {
	Compute(amounts []float64) ([]float64, float64)
}

type SumCalculator struct {
	Engine SumEngine
}

func (sc *SumCalculator) Compute(amounts []float64) ([]float64, float64) {
	return sc.Engine.Compute(amounts)
}

// --- Penny Engine ---
type PennyEngine struct{}
func (p *PennyEngine) Compute(amounts []float64) ([]float64, float64) {
	var steps []float64
	totalPennies := 0
	for _, amount := range amounts {
		totalPennies += int(amount * 100)
		steps = append(steps, float64(totalPennies)/100.0)
	}
	return steps, float64(totalPennies) / 100.0
}

// --- Float Math Engine ---
type FloatMathEngine struct{}
func (fm *FloatMathEngine) Compute(amounts []float64) ([]float64, float64) {
	var steps []float64
	total := 0.0
	for _, amount := range amounts {
		total += amount
		steps = append(steps, total)
	}
	return steps, total
}

// --- Kahan Engine ---
type KahanEngine struct{}
func (k *KahanEngine) Compute(amounts []float64) ([]float64, float64) {
	var steps []float64
	total := 0.0
	c := 0.0

	for _, amount := range amounts {
		y := amount - c
		t := total + y
		c = (t - total) - y
		total = t
		steps = append(steps, total)
	}
	return steps, total
}

// --- Neumaier Engine ---
type NeumaierEngine struct{}
func (n *NeumaierEngine) Compute(amounts []float64) ([]float64, float64) {
	var steps []float64
	sum := 0.0
	c := 0.0
	for _, x := range amounts {
		t := sum + x
		if math.Abs(sum) >= math.Abs(x) {
			c += (sum - t) + x
		} else {
			c += (x - t) + sum
		}
		sum = t
		steps = append(steps, sum+c)
	}
	return steps, sum + c
}

// --- BigFloat Engine ---
type BigFloatEngine struct{}
func (b *BigFloatEngine) Compute(amounts []float64) ([]float64, float64) {
    sum := big.NewFloat(0)
	var steps []float64
    for _, amt := range amounts {
        sum.Add(sum, big.NewFloat(amt))
		tmp, _ := sum.Float64()
		steps = append(steps, tmp)
    }
    f64, _ := sum.Float64()
    return steps, f64
}

// --- Sorted Sum Engine ---
type SortedSumEngine struct{}
func (s *SortedSumEngine) Compute(amounts []float64) ([]float64, float64) {
	var steps []float64
    sorted := make([]float64, len(amounts))
    copy(sorted, amounts)
    sort.Float64s(sorted)
    total := 0.0
    for _, x := range sorted {
        total += x
		steps = append(steps, total)
    }
    return steps, total
}



// --- Main ---
func main() {
	n := 5000000
	values := getValues(n)

	engines := []SumEngine{
		&PennyEngine{},
		&FloatMathEngine{},
		&KahanEngine{},
		&NeumaierEngine{},
		&BigFloatEngine{},
		&SortedSumEngine{},
	}

	names := []string{
		"PennyEngine",
		"FloatMathEngine",
		"KahanEngine",
		"NeumaierEngine",
		"BigFloatEngine",
		"SortedSumEngine",
	}

	results := make(map[string][]float64)
	finals := make(map[string]float64)

	for i, engine := range engines {
		calc := SumCalculator{Engine: engine}
		steps, total := calc.Compute(values)
		results[names[i]] = steps
		finals[names[i]] = total
		fmt.Printf("Total using %s: %.10f\n", names[i], total)
	}
}	

func getValues(n int) []float64 {
	rand.Seed(time.Now().UnixNano())
	min := 50   // $0.50
	max := 200  // $2.00

	var x []float64
	for i := 0; i < n; i++ {
		x = append(x, float64(rand.Intn(max-min+1)+min)/100.0)
	}
	return x
}

