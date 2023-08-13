FROM node:16.15.0-alpine
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm i

EXPOSE 3000

CMD ["npm", "run", "dev"]
