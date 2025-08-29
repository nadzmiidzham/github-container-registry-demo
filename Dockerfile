FROM ghcr.io/nadzmiidzham/ghcr-demo:latest AS dependency
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM ghcr.io/nadzmiidzham/ghcr-demo:latest AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
RUN npm run build

FROM node:22.18-alpine
WORKDIR /app
COPY --from=dependency /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
CMD ["npm", "start:prod"]
