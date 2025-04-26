package main

import "fmt"

type SinglyLinkedList[T any] struct {
    Head   *Node[T]
    Tail   *Node[T]
    length int
}

type Node[T any] struct {
    Value T
    Next  *Node[T]
}

func NewNode[T any](value T) *Node[T] {
    return &Node[T]{Value: value, Next: nil}
}

func NewSinglyLinkedList[T any]() *SinglyLinkedList[T] {
    return &SinglyLinkedList[T]{Head: nil, Tail: nil, length: 0}
}

func (l *SinglyLinkedList[T]) InsertAtHead(value T) {
    n := NewNode(value)
    if l.length == 0 {
        l.Head = n
        l.Tail = n
        l.length++
    } else {
        n.Next = l.Head
        l.Head = n
        l.length++
    }
}

func (l *SinglyLinkedList[T]) InsertAtTail(value T) {
    n := NewNode(value)
    if l.length == 0 {
        l.InsertAtHead(value)
    } else {
        l.Tail.Next = n
        l.Tail = n
        l.length++
    }
}

func (l *SinglyLinkedList[T]) InsertAtIndex(value T, index int) {
    n := NewNode(value)
    if l.length == 0 {
        l.InsertAtHead(value)
    } else if index == 0 {
        l.InsertAtHead(value)
    } else if index == l.length -1 { 
        l.InsertAtTail(value)
    } else {
        cur := l.Head
        for i:=0; i < index; i++ {
            if i + 1  == index  {
                n.Next = cur.Next
                cur.Next = n
                l.length++
            }
            cur = cur.Next
        }
    }
}

func (l *SinglyLinkedList[T]) PrintList() {
    cur := l.Head
    for cur != nil {
        fmt.Printf("%d,", cur.Value)
        cur = cur.Next
    }
    fmt.Println("")
}

func main() {
    fmt.Println("AT TAIL--expect: 1,2,3--------")
    l1 := NewSinglyLinkedList[int]() // Change to use the specific type
    l1.InsertAtTail(1)
    l1.InsertAtTail(2)
    l1.InsertAtTail(3)
    l1.PrintList()
    fmt.Println("----------")

    fmt.Println("AT HEAD--expect: 3,2,1--------")
    l2 := NewSinglyLinkedList[int]() // Change to use the specific type
    l2.InsertAtHead(1)
    l2.InsertAtHead(2)
    l2.InsertAtHead(3)
    l2.PrintList()
    fmt.Println("----------")

    l3 := NewSinglyLinkedList[int]() // Change to use the specific type
    l3.InsertAtTail(10)
    l3.InsertAtTail(20)
    l3.InsertAtTail(30)
    l3.InsertAtIndex(5, 0)
    l3.InsertAtIndex(35, 3)
    l3.InsertAtIndex(7, 1)
    l3.InsertAtIndex(15, 3)
    l3.InsertAtIndex(25, 5)
    l3.PrintList()
    fmt.Println("----------")



}

