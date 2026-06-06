FROM node:18-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
RUN echo '{"name":"backend","version":"1.0.0"}' > package.json
RUN echo 'const http = require("http"); const server = http.createServer((req,res) => { res.writeHead(200, {"Content-Type":"application/json"}); res.end(JSON.stringify({status:"ok",service:"backend-innovatech"})); }); server.listen(3000, () => console.log("Backend corriendo en puerto 3000"));' > server.js
USER appuser
EXPOSE 3000
CMD ["node", "server.js"]
