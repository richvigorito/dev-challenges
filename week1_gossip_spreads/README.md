# 🏆 Week [1] - Build Your Own Pub/Sub System

## 📝 Challenge Overview
Build a lightweight **Publish/Subscribe messaging system** from scratch — no external libraries, frameworks, or brokers allowed!

This challenge explores messaging patterns, decoupled architecture, and async delivery — all fundamental ideas behind systems like Redis Pub/Sub, Kafka, and message queues. 
 

---
## 🏁 Challenge Format: 
**Collaborative** 🤝💻 With your team or subteams implment a publish/subscribe broker.


### 📋 Requirements & Specifications

- `subscribe(channel, callback)`  
  Register a function (`callback`) that listens for messages on a given `channel`.

- `publish(channel, message)`  
  Send a message to all subscribers of the `channel`.

- Multiple subscribers can subscribe to the same channel.
- A subscriber can listen to multiple channels.

---
## 🎯 Bonus Ideas

- Async message delivery
- Add an HTTP API to publish/subscribe
- Add a frontend UI (e.g. via WebSockets)

---

### 🔧 Example Usage
```python
pubsub = PubSub()

def handle_relationships(msg):
    print(f"Can you believe it?!: {msg}")

def handle_workplace(msg):
    print(f"Can you believe it: {msg}")

pubsub.subscribe("breakups", handle_relationships)
pubsub.subscribe("workplace", handle_workplace)
pubsub.subscribe("cheats", handle_relationships)

pubsub.publish("cheats", "J is cheating on Will.")
pubsub.publish("workplace", "I think we have to do server maintenance on sunday.")
pubsub.publish("breakups", "K and K are no more.")
```

Expected Output
```yaml
Can you believe it?!: J is cheating on Will.
Ugh, this again: I think we have to do server maintenance on sunday.!
Can you believe it?!: K and K are no more.
```

---
## 🛠 Solutions Available:
[![Go cmd line (tcp)](https://img.shields.io/badge/Go-1.21-blue?logo=go)](solutions/go)
[![C cmd line (tcp)](https://img.shields.io/badge/Go-1.21-blue?logo=go)](solutions/c)
[![C](https://img.shields.io/badge/C-00599C?logo=c&logoColor=white)](solutions/c)
[![Python Broker/API (websockets)](https://img.shields.io/badge/Python-3.11-blue?logo=python)](solutions/python)
[![React UI](https://img.shields.io/badge/React-17-blue?logo=react)](solutions/react_frontend)
