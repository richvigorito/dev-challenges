from typing import Dict, List
import asyncio
import unittest

class Broker:
    def __init__(self):
        self.subscribers: Dict[str, List[asyncio.Queue]] = {}

    async def subscribe(self, topic: str) -> asyncio.Queue:
        queue = asyncio.Queue()

        if topic not in self.subscribers:
            self.subscribers[topic] = []

        self.subscribers[topic].append(queue)
        return queue

    async def publish(self, topic: str, message: str):
        if topic in self.subscribers:
            for queue in self.subscribers[topic]:
                await queue.put(message)


# Unit tests for Broker class
class TestBroker(unittest.IsolatedAsyncioTestCase):  
    async def asyncSetUp(self):
        self.broker = Broker()

    async def test_subscribe_and_publish(self):
        topic = "newsletters"

        # Subscriber 1
        queue1 = await self.broker.subscribe(topic)
        # Subscriber 2
        queue2 = await self.broker.subscribe(topic)

        # Publish a message
        message = "🚨 New edition is out!"
        await self.broker.publish(topic, message)

        # Make sure both subscribers got it
        m1 = await queue1.get()
        print(f"Subscriber 1 received: {m1}")
        self.assertEqual(m1, message)

        m2 = await queue2.get()
        print(f"Subscriber 2 received: {m2}")
        self.assertEqual(m2, message)

if __name__ == "__main__":
    unittest.main()
