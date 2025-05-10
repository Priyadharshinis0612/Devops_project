const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// Serve static files from the 'src' folder
app.use(express.static(path.join(__dirname, 'src')));

// Main route
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'src', 'index.html')); // Adjust path if necessary
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
