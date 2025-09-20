# syntax=docker/dockerfile:1
FROM node:18-slim

WORKDIR /app

# Add build tools for native modules
RUN apt-get update && apt-get install -y \
  python-is-python3 \
  build-essential \
  pkg-config \
  && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

# Use legacy-peer-deps to bypass conflicts
RUN npm install --legacy-peer-deps

COPY . .

CMD ["node", "proxy.js"]
