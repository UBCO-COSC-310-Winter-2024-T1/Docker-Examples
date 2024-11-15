import React, { useState, useEffect } from 'react';

function App() {
  //const [message, setMessage] = useState('');
  const [message, setMessage] = useState('Click the button to fetch a message.');

  // Fetch the message from the backend when the button is clicked
  const fetchMessage = () => {
    fetch('/api/message')
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => setMessage(data.message))
      .catch((error) => setMessage('Failed to fetch message: ' + error.message));
  };

  useEffect(() => {
    // Fetch data from the backend API
    fetch('/api/message')
      .then((response) => response.json())
      .then((data) => setMessage(data.message))
      .catch((error) => console.error('Error fetching data:', error));
  }, []);

  // return (
  //   <div style={{ textAlign: 'center', marginTop: '50px' }}>
  //     <h1>React Frontend</h1>
  //     <p>Message from the Backend:</p>
  //     <p style={{ fontWeight: 'bold' }}>{message}</p>
  //   </div>
  // );
return (
    <div style={{ textAlign: 'center', marginTop: '50px' }}>
    <h1>React Frontend</h1>
    <p>{message}</p>
    <button
      onClick={fetchMessage}
      style={{
        backgroundColor: '#4caf50',
        color: 'white',
        border: 'none',
        padding: '10px 20px',
        fontSize: '16px',
        cursor: 'pointer',
        borderRadius: '5px',
      }}
    >
      Fetch Message
    </button>
  </div>
  );
}

export default App;
