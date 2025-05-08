package main

import "fmt"

func swap(a, b int) (int, int) {
    return b, a
}

func main() {
    a, b := 1, 2
    fmt.Println("Before:", a, b)
    a, b = swap(a, b)
    fmt.Println("After:", a, b)
}
