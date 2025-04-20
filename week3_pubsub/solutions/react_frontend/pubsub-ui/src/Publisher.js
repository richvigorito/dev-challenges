import React, { useState } from 'react';

const Publisher = () => {
  const [topic, setTopic] = useState('');
  const [input, setInput] = useState('');

  const handlePublish = async () => {
    if (!topic || !input) return;

    console.log(topic);
    console.log(input);

    await fetch(`http://localhost:8000/publish/raw/${topic}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ message: input }),
    });

    setInput('');
  };

  return (
    <div>
      <h3>📝 Publish</h3>
      <input
        type="text"
        placeholder="Topic"
        value={topic}
        onChange={(e) => setTopic(e.target.value)}
      />
      <input
        type="text"
        placeholder="Message"
        value={input}
        onChange={(e) => setInput(e.target.value)}
      />
      <button onClick={handlePublish}>Send</button>
    </div>
  );
};

export default Publisher;
