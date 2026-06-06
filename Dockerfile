# Stage 1: Dependencias
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm install --ignore-scripts 2>/dev/null || true

# Stage 2: Produccion
FROM node:18-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
USER appuser
EXPOSE 3000
CMD ["node", "server.js"]
