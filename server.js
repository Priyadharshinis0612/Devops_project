const express = require('express');
const path = require('path');
const app = express();

// Serve static files from the 'src' folder
app.use(express.static(path.join(__dirname, 'src')));

// Serve index.html on root route
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'src', 'index.html'));
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
