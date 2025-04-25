package main

import (
	"fmt"
)

func reverseString(str string) string {
    runes := []rune(str)
    l := len(runes)
    reversed := ""

    for i := l-1; i >= 0; i-- {
	reversed += string(runes[i])
    }

    return reversed
}

func main() {
	example1 := "hello"
	reversed1 := reverseString(example1)
	fmt.Println("Original:", example1)
	fmt.Println("Reversed:", reversed1)

	fmt.Println("")

	example2 := "Hello, 世界🌍"
	reversed2 := reverseString(example2)
	fmt.Println("Original:", example2)
	fmt.Println("Reversed:", reversed2)
}


