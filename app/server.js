const express = require('express');
const app = express();
app.get('/', (req, res) => {
    res.send('Hello From devops project');
});
app.get('/health', (req, res) => {
    res.json({ status: 'UP' });
});
app.listen(3000, () => {
    console.log('Server is running on port 3000');
});