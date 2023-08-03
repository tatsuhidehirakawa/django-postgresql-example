FROM node:16.15.0-alpine
WORKDIR /usr/src/app

RUN npm install -g create-react-app@latest
RUN create-react-app . --typescript

COPY package*.json ./
RUN npm install

# Make a standby state.
CMD [ "yarn", "start" ]
