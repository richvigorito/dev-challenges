import React, { useEffect, useState } from 'react';

const Subscriber = () => {
  const [topic, setTopic] = useState('');
  const [messages, setMessages] = useState([]);
  const [ws, setWs] = useState(null);

  useEffect(() => {
    // Clean up on unmount
    return () => {
      if (ws) {
        ws.close();
      }
    };
  }, [ws]);

  const handleSubscribe = () => {
    if (!topic) return;

    // Close existing connection
    if (ws) {
      ws.close();
    }

    const newWs = new WebSocket(`ws://localhost:8000/subscribe/${topic}`);
    setWs(newWs);

    newWs.onopen = () => {
      console.log(`✅ Subscribed to ${topic}`);
      setMessages([]);
    };

    newWs.onmessage = (event) => {
      try {
        const data = JSON.parse(event.data);
        console.log('📨 Received:', data.message);
        if (data.message) {
          setMessages((prev) => [...prev, data.message]);
        }
      } catch (err) {
        console.warn('❌ Parse error:', err);
      }
    };

    newWs.onerror = (err) => {
      console.error('WebSocket error:', err);
    };

    newWs.onclose = () => {
      console.log(`❌ Unsubscribed from ${topic}`);
    };
  };

  return (
    <div>
      <h3>🔔 Subscribe</h3>
      <input
        type="text"
        placeholder="Topic"
        value={topic}
        onChange={(e) => setTopic(e.target.value)}
      />
      <button onClick={handleSubscribe}>Subscribe</button>

      {messages.length > 0 && (
        <ul>
          {messages.map((msg, i) => (
            <li key={i}>{msg}</li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Subscriber;
