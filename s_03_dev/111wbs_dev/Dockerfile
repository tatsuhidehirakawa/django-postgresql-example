FROM node:16.15.0-alpine
WORKDIR /usr/src/app

RUN npx create-next-app@latest . --ts --eslint

COPY package*.json ./
RUN npm i

EXPOSE 3000

CMD ["npm", "run", "dev"]