const http = require('http');

const hostname = '0.0.0.0';
const port = 4000;

const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html');
    res.end('<html><body><h1>Coming soon ...</h1><div style="padding-left: 50px"><p><!--<a href="http://dev.nitdian.org">View progress</a>--!></p></div></body></html>');
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});