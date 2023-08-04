FROM node:16.15.0-alpine
WORKDIR /usr/src/app

RUN npm i -g create-react-app@latest
RUN create-react-app . --typescript

COPY package*.json ./
RUN npm i

# Make a standby state.
CMD [ "yarn", "start" ]
