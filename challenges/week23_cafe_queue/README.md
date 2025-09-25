# Week 23: The "Queue Cafe"

Two weeks ago we revisited some easy yet historically significant functions in C (shoutout to Dennis Ritchie). One of them — 
```c 
while ((c = getchar()) != EOF) putchar(c);
```
---

## 📝 Background

* In a Pub/Sub model:
  * Messages are broadcast to all subscribers.
  * Every subscriber sees every message.

* In a Queue model:
  * Messages are consumed by exactly one subscriber.
  * Multiple subscribers may exist, but each message should only be delivered once.

Your job is to make that change.

---

## 🎯 The Challenge

Modify the code so that:

1) Single consumer per message
  * When a publisher sends a message, only one subscriber should receive it.
  * If multiple subscribers exist, they should fairly share the work (round-robin or first-come-first-served).

---

## ✅ Example

With 2 subscribers and 4 published messages:

* Pub/Sub (current)
  * Sub A receives: 1,2,3,4
  *  Sub B receives: 1,2,3,4
* Queue (goal)
  * Sub A receives: 1,3
  * Sub B receives: 2,4

🔥 Bonus Ideas

1)  Persistence (optional extension)
  * Store published messages in a file so the queue can survive restarts.
  * Use the line number (or file offset) to track consumer progress.
2) Offset management (optional extension)
  * Each subscriber should keep track of where it is in the queue.
  * On reconnect, a subscriber should resume from its last offset.

---

## 🛠 Sample Implementations
Inside the `solutions/` directory:

[![C](https://img.shields.io/badge/C-17-blue?logo=c)](solutions)
