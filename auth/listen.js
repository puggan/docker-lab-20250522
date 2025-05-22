const express = require('express');
const path = require('path');  // To handle file paths
const auth = require('./auth');
const jwt = require('./jwt');
// Initialize the app
const app = express();

// Middleware to parse form data (application/x-www-form-urlencoded)
app.use(express.urlencoded({extended: true}));

app.get('/', (req, res) => {
    res.redirect(301, '/login');
});

// Serve the form when accessing /login (GET)
app.get('/login', (req, res) => {
    // Send the HTML form as a response
    return res.sendFile(path.join(__dirname, 'form.html'));
});

// First endpoint: POST /endpoint1
app.post('/login', (req, res) => {
    if (!auth(req.body.username, req.body.password)) {
        return res.status(403).type('text/plain').send('Invalid user');
    }
    return res.type('text/plain').send(jwt(req.body.username, false));
});

app.get('/expired', (req, res) => {
    // Send the HTML form as a response
    return res.sendFile(path.join(__dirname, 'form.html'));
});

// Second endpoint: POST /endpoint2
app.post('/expired', (req, res) => {
    if (!auth(req.body.username, req.body.password)) {
        return res.status(403).type('text/plain').send('Invalid user');
    }
    return res.type('text/plain').send(jwt(req.body.username, true));
});

const port = process.argv[2] || 8080;
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
