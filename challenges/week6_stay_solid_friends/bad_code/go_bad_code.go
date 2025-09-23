package main

import "fmt"

// if you want a hint for what principles are broken
// decode the following hex strings
//
// 4C 53 50
// 49 53 50


type Bird interface {
	Fly()
}

type Eagle struct{}

func (e Eagle) Fly() {
	fmt.Println("Eagle flying!")
}

type Ostrich struct{}

func (o Ostrich) Fly() {
	panic("Ostriches can't fly!")
}

