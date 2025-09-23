# 🏆 Week [2] - Implement a Linked List from Scratch

## 📝 Challenge Overview

Remember your **Intro To Data Structures** days? It’s time to dust off those memories and implement a **Linked List** from scratch. No arrays, no built-in lists—just good ol' pointers and data manipulation!

This challenge will give you hands-on experience with how data can be organized and navigated without relying on high-level abstractions. Perfect for understanding foundational computer science concepts like memory management, pointers, and dynamic data structures.

---
## 🏁 Challenge Format: 
This can be  **Collaborative** 🤝💻 or probably more **Head-to-Head** 🏁🔥 and given 30 mins how far can each person get and then share your results. Spice it up and each person pick a different langauge and implement, then show the implementation discussing the differences.  

### 📋 Requirements & Specifications

1. **Node**:
   - Create a `Node` class (or equivalent) to represent the elements in the linked list. Each node should store:
     - The data (could be any data type)
     - A pointer to the next node in the list (set to `null` or `None` for the last node)

2. **Linked List Operations**:
   - `insertAtHead(data)` – Insert a new node at the head of the list.
   - `insertAtTeail(data)` – Insert a new node at the end of the list.
   - `delete(data)` – Delete the first occurrence of a node with the given data.
   - `deleteFirst()` – Delete the first occurrence of a node with the given data.
   - `deleteLast()` – Delete the first occurrence of a node with the given data.
   - `search(data)` – Return `True` if a node with the given data exists, otherwise return `False`.
   - `print_list()` – Print out the contents of the list.

3. **Bonus (Optional)**:
   - `reverse()` – Reverse the linked list in place.
   - Implement a **doubly linked list** where each node has pointers to both the next and previous nodes.

---

## 🎯 Bonus Ideas

- Implement a method to **sort** the linked list.
- Implement a Doubly Linked List
- Add a method to **find the middle node** in a linked list.

---

### 🔧 Example Usage
```python
CongaLine = LinkedList  # class alias
putYourHandUpOnMyHip = LinkedList.insertAtTail  # function alias

conga_line = LinkedList()
putYourHandUpOnMyHip(conga_line,  'Alice')
putYourHandUpOnMyHip(conga_line,  'Bob')
putYourHandUpOnMyHip(conga_line,  'Julie')
conga_line.print_list()  # Output: Alice -> Bob -> Julie -> None

conga_line.delete(1)
conga_line.print_list()  # Output: Alice -> Julie -> None

print(conga_line.search('Alice'))  # Output: Alice
print(conga_line.search('Bob'))  # Output: False
```
---
## 🛠 Solutions Available:
[![Go](https://img.shields.io/badge/Go-1.21-blue?logo=go)](solutions/go/linkedlist.go)
[![Python Version](https://img.shields.io/badge/Python-3.11-blue?logo=python)](solutions/python/linkedlist.py)
