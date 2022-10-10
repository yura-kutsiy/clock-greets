FROM node:18.10.0-alpine3.15 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod