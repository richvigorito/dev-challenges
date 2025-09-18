# Week 22: "C" what they're sayin' at the pub/sub pub

Last week we revisited some easy yet functions in C from (The C Programming Language)[https://www.amazon.com/Programming-Language-Brian-W-Kernighan/dp/0131101633] (shoutout to Dennis Ritchie). One of them — 
```c 
while ((c = getchar()) != EOF) putchar(c);
```
— is basically the DNA of a pub/sub broker: read, forward, repeat.

This week we’re building on:
- Week 1’s (Pub/Sub Broker)[../week1_gossip_spreads] challenge and
- Last week’s (C mini-functions)[../week21_dennis_ritchie] challenge.

---

## Challenge

Transform your Week 1 pub/sub solution into a **streaming** system by adding:
1. **Reply** — allow a consumer to send a response back to the original publisher.
2. **Persistence** — retain messages so new or restarted consumers can **replay** from a chosen point.

---

## 🏁 Challenge Format:  
- **Collaborative Build**: pair or group up and ship a shared design.
- **Head-to-Head Race**: first working demo that meets acceptance criteria wins.

---

### 📋 Requirements & Specs


You may reuse your Week 1 code. If you didn’t do Week 1, you can start from the provided reference solutions (C or Go). **Encouraged:** use the C version to keep the Dennis Ritchie theme rolling.

- Broker must store messages for reply. A file is the file and easiest path forward
- New messages are appended to the file
- Consumers upon start up, replay messages to get caught up. 
-
-
## 🎯 Bonus Ideas

**Reply**
- Add ability to specify start offset or replay-to offset functionality

**Topics**
- Update the broker be topic aware, where consumers specify the topic(s) they consume

**Subscriptions**
- Multiple subscribers per topic (fan-out).
- Each subscriber tracks its own read position (cursor).

**Delivery**
- At-least-once delivery is sufficient (duplicates allowed). Best-effort ordering per topic.

---

## 🛠 Sample Implementations
Inside the `solutions/` directory:

[![C](https://img.shields.io/badge/C-17-blue?logo=c)](solutions)
