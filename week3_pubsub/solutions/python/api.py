# api.py

from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Request
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from broker import Broker
from datetime import datetime

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


broker = Broker()

class PublishRequest(BaseModel):
    message: str

# WebSocket route for subscribing to a topic
@app.websocket("/subscribe/{topic}")
async def subscribe(websocket: WebSocket, topic: str):
    # Accept the WebSocket connection
    await websocket.accept()

    # Get a queue for this topic (subscriber)
    queue = await broker.subscribe(topic)

    try:
        while True:
            # Wait for a new message in the queue
            message = await queue.get()

            print(f"Received message: {message} on topic {topic}")

            # Send the message to the WebSocket client
            await websocket.send_text(message)
    except WebSocketDisconnect:
        print(f"Client disconnected from topic: {topic}")

# REST API endpoint to publish a message to a topic
@app.post("/publish/message/{topic}")
async def publish(topic: str, request: PublishRequest):
    await broker.publish(topic, request.message)
    return {"message": "Message published successfully"}


# REST API endpoint to publish raw message/json
@app.post("/publish/raw/{topic}")
async def publishRaw(topic: str, request: Request):
    body = await request.body()
    message = body.decode()
    await broker.publish(topic, message)
    return {"status": "published"}
