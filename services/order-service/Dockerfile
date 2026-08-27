# Stage 1 : installation des dépendances
FROM node:18-bookworm-slim AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

# Stage 2 : image finale
FROM node:18-bookworm-slim
WORKDIR /app
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
COPY --from=builder /app/node_modules ./node_modules
COPY src ./src
COPY package*.json ./
USER appuser
EXPOSE 3002
CMD ["node", "src/app.js"]