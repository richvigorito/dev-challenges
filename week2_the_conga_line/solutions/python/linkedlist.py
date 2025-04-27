from typing import TypeVar, Generic, Optional

T = TypeVar('T')

class Node(Generic[T]):
    def __init__(self, value: T):
        self.value: T = value
        self.next: Optional['Node[T]'] = None

class SinglyLinkedList(Generic[T]):
    def __init__(self):
        self.head: Optional[Node[T]] = None
        self.tail: Optional[Node[T]] = None
        self.length: int = 0

    def insert_at_head(self, value: T):
        n = Node(value)
        if self.length == 0:
            self.head = n
            self.tail = n
        else:
            n.next = self.head
            self.head = n
        self.length += 1

    def insert_at_tail(self, value: T):
        if self.length == 0:
            self.insert_at_head(value)
        else:
            n = Node(value)
            assert self.tail is not None  # for type checker
            self.tail.next = n
            self.tail = n
            self.length += 1

    def insert_at_index(self, value: T, index: int):
        if index <= 0 or self.length == 0:
            self.insert_at_head(value)
        elif index >= self.length:
            self.insert_at_tail(value)
        else:
            n = Node(value)
            current = self.head
            for i in range(index - 1):
                assert current is not None  # for type checker
                current = current.next
            assert current is not None
            n.next = current.next
            current.next = n
            self.length += 1

    def print_list(self):
        current = self.head
        while current:
            print(f"{current.value}", end=",")
            current = current.next
        print()

# Test cases
if __name__ == "__main__":
    print("AT TAIL--expect: 1,2,3--------")
    l1 = SinglyLinkedList[int]()
    l1.insert_at_tail(1)
    l1.insert_at_tail(2)
    l1.insert_at_tail(3)
    l1.print_list()
    print("----------")

    print("AT HEAD--expect: 3,2,1--------")
    l2 = SinglyLinkedList[int]()
    l2.insert_at_head(1)
    l2.insert_at_head(2)
    l2.insert_at_head(3)
    l2.print_list()
    print("----------")

    print("MIXED INSERTS--expect: 5,7,10,15,20,25,30,35")
    l3 = SinglyLinkedList[int]()
    l3.insert_at_tail(10)
    l3.insert_at_tail(20)
    l3.insert_at_tail(30)
    l3.insert_at_index(5, 0)
    l3.insert_at_index(35, 10)
    l3.insert_at_index(7, 1)
    l3.insert_at_index(15, 3)
    l3.insert_at_index(25, 5)
    l3.print_list()
    print("----------")

