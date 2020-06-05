const http = require ('http');
const message = "Hello World!"
const PORT = 8080;

const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(message);
})

server.listen(PORT, () => {
    console.log(`server is listening on port ${PORT}`)
});