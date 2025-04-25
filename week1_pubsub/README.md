## 🧪 Dev Challenge 003 – Pub/Sub System from Scratch

## Objective

Build a lightweight **Publish/Subscribe messaging system** from scratch — no external libraries, frameworks, or brokers allowed!

This challenge explores messaging patterns, decoupled architecture, and async delivery — all fundamental ideas behind systems like Redis Pub/Sub, Kafka, and message queues.

---

## 💡 The Challenge

Implement a basic Pub/Sub system in your language of choice with the following core functionality:

### 🧩 Requirements

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

## 🧪 Example Usage

```python
pubsub = PubSub()

def handle_news(msg):
    print(f"News: {msg}")

def handle_sports(msg):
    print(f"Sports Update: {msg}")

pubsub.subscribe("news", handle_news)
pubsub.subscribe("sports", handle_sports)
pubsub.subscribe("news", handle_sports)

pubsub.publish("news", "Mars landing successful!")
pubsub.publish("sports", "Home run in the 9th inning!")
```

Expected Output
```yaml
News: Mars landing successful!
Sports Update: Mars landing successful!
Sports Update: Home run in the 9th inning!
```

---

## 🧩 Optional Solutions
```
solutions/
├── python/          # Python backend (Pub/Sub broker + FastAPI + WebSocket)
└── react_frontend/  # Optional React UI
