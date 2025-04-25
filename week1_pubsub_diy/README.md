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
