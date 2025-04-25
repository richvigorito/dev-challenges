# 🐍 Pub/Sub System – Python (FastAPI + WebSocket)

This is a sample solution to Dev Challenge 003: a simple async pub/sub system written in Python with FastAPI.

It features:

- A lightweight in-memory pub/sub broker
- Async message delivery using `asyncio`
- HTTP API for publishing messages
- WebSocket API for subscribing to topics

---

## 🚀 How to Run

1) **(Optional)** Create a virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
```
2) Install dependencies:
```bash
pip install -r requirements.txt
```
3) Start the server:
```bash
uvicorn api:app --reload
```
The server will run at http://localhost:8000.

## 🔌 Endpoints
📬 Publish Raw Message
POST ``/publish/raw/<topic>``

Decodes and sends a message to all current WebSocket subscribers of a given topic.

Example:
```bash
curl -X POST http://localhost:8000/publish/raw/news \
  -H "Content-Type: application/json" \
  -d '{"message": "Breaking news!", "timestamp": "2025-04-20T18:46:25Z"}'
```

📡 Subscribe to Topic
WebSocket ``subscribe/<topic>``

Opens a WebSocket connection to receive real-time messages published to that topic.

You can test this with tools like:
- [Websocketking.com](http://websocketking.com)
- [hoppscotch.io](http://hoppscotch.io)
- [sample react ui](/week3_pubsub/solutions/react_frontend)

Example URL:
```bash
ws://localhost:8000/subscribe/news
```
🧠 Core Concepts
broker.py contains the core PubSubBroker logic (subscribe, publish, async queueing), api.py handles the FastAPI server and routes
