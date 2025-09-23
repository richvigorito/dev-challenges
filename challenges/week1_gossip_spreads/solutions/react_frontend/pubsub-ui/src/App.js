import React from 'react';
import Publisher from './Publisher';
import Subscriber from './Subscriber';

const App = () => {
  return (
    <div>
      <h2>🧪 Pub/Sub UI</h2>
      <Publisher />
      <Subscriber />
    </div>
  );
};

export default App;

