FROM node:18-bullseye-slim

# Instala o FFMPEG (obrigatório para áudios do Zap)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./
RUN npm install --legacy-peer-deps
COPY . .
EXPOSE 8080
CMD ["npm", "run", "start"]
