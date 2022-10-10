FROM node:stable-alpine as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod