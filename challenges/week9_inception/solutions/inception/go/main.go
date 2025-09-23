package main

/*
#cgo CFLAGS: -I../c
#cgo LDFLAGS: -L.. -lnqueens
#include "nqueens.h"
*/
import "C"
import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	// Check if there is an argument passed
	if len(os.Args) < 2 {
		fmt.Println("Please provide the number of queens as a command-line argument.")
		return
	}

	// Parse the number of queens (n) from the command-line argument
	n, err := strconv.Atoi(os.Args[1])
	if err != nil {
		fmt.Println("Invalid number provided:", err)
		return
	}

	// Calling the C function with the parsed value
	fmt.Printf("Calling C N-Queens with %d queens:\n", n)
	C.run_nqueens(C.int(n))
}

