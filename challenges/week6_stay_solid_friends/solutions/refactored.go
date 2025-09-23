package main

import "fmt"

/**
*
*
*
 broken solid principle hint (in hex): LSP, ISP

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
*/




///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
/*
 * refactored code addresses the following:
 *
 * LSP: Ostrich no longer implemented Bird only to panic whey Fly() 
				was called. 
 * ISP: Tho maybe weird example for Go due to its implicit interface 
				implemented Ostrich is now longer forced to implement fly 
				(i meant weird cause Ostrich *chose* to implement Fly). We 
				instead have 2 thing interfaces instead one big fat bird 
				interface (like Ostriches ;)) 
 */

type Bird interface {
	Wingspan()
	Weight()
}

type CanFly interface {
	Fly()
}

type Eagle struct{}

func (e Eagle) Wingspan() {
	fmt.Println("6ft!")
}

func (e Eagle) Weight() {
	fmt.Println("10lbs!")
}

func (e Eagle) Fly() {
	fmt.Println("Eagle flying!")
}

type Ostrich struct{}

func (o Ostrich) Wingspan() {
	fmt.Println("6.6ft!")
}

func (o Ostrich) Weight() {
	fmt.Println("200lbs!")
}
