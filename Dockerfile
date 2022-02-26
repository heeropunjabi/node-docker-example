FROM node:14-alpine as base

WORKDIR /src
COPY package*.json /

FROM base as production
WORKDIR /src
COPY package*.json /
RUN npm install
COPY . /
EXPOSE 3001

FROM base as dev
WORKDIR /src
COPY package*.json /
RUN npm install -g nodemon && npm install
COPY . /
EXPOSE 3000
