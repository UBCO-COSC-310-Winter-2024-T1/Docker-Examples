# Dockerfile for Node.js Backend
FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 6000
CMD ["npm", "run", "dev"]
#CMD ["node", "server.js"]