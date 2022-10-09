FROM node:14.15.4-alpine as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod