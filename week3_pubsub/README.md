# Dev Challenge 00X - Pub/Sub System from Scratch

Build a lightweight **Publish/Subscribe messaging system** from scratch — no external libraries, frameworks, or brokers allowed!

This challenge explores messaging patterns, decoupled architecture, and async delivery — all fundamental ideas behind systems like Redis Pub/Sub, Kafka, and message queues.

---

## 💡 The Challenge

Implement a basic Pub/Sub system in your language of choice with the following core functionality:

### 🧩 Required Features

- `subscribe(channel, callback)`  
  Register a function (`callback`) that listens for messages on a given `channel`.

- `publish(channel, message)`  
  Send a message to all subscribers of the `channel`.

- Multiple subscribers can subscribe to the same channel.
- A subscriber can listen to multiple channels.

### 🧪 Example Usage

```python
pubsub = PubSub()

def handle_news(msg):
    print(f"News: {msg}")

def handle_sports(msg):
    print(f"Sports Update: {msg}")

pubsub.subscribe("news", handle_news)
pubsub.subscribe("sports", handle_sports)
pubsub.subscribe("news", handle_sports)  # Multiple listeners on same channel

pubsub.publish("news", "Mars landing successful!")
pubsub.publish("sports", "Home run in the 9th inning!")

output: 
```
News: Mars landing successful!
Sports Update: Mars landing successful!
Sports Update: Home run in the 9th inning!
