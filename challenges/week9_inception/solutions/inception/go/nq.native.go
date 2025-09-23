package main

import (
	"fmt"
	"os"
	"strconv"
	"math"
)

var count int

// solve is the backtracking function for solving N-Queens problem
func solve(n, col int, hist []int) {
	if col == n {
		// Print the solution
		count++
		fmt.Printf("\nNo. %d\n-----\n", count)
		for i := 0; i < n; i++ {
			for j := 0; j < n; j++ {
				if j == hist[i] {
					fmt.Print("Q ")
				} else {
					// Print alternating spaces and dots
					if (i+j)%2 == 1 {
						fmt.Print("  ")
					} else {
						fmt.Print(". ")
					}
				}
			}
			fmt.Println()
		}
		return
	}

	// attack checks if the queen in row i and column col is attacked
	for i := 0; i < n; i++ {
		// Check if placing the queen in row i, column col is safe
		attack := false
		for j := 0; j < col; j++ {
			if hist[j] == i || int(math.Abs(float64(hist[j]-i))) == col-j {
				attack = true
				break
			}
		}
		if attack {
			continue
		}

		// Place queen in hist[col] = i (row i, column col)
		hist[col] = i
		// Recurse to solve for next column
		solve(n, col+1, hist)
	}
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Please provide the number of queens as a command-line argument.")
		return
	}

	// Parse the number of queens from command-line argument
	n, err := strconv.Atoi(os.Args[1])
	if err != nil || n <= 0 {
		fmt.Println("Invalid input. Please provide a positive integer for the number of queens.")
		return
	}

	// Initialize the histogram to hold the positions of queens in each column
	hist := make([]int, n)

	// Start solving the N-Queens problem
	fmt.Printf("Solving %d-Queens Problem:\n", n)
	solve(n, 0, hist)
}
