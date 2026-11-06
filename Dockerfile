FROM node:22-alpine

WORKDIR /app

ENV NODE_ENV=production \
    PORT=8080

COPY package*.json ./
RUN npm ci --omit=dev

COPY index.js ./

USER node

EXPOSE 8080

CMD ["node", "index.js"]
