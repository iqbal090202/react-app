# Stage 1
FROM node:18.13.0 as build-Stage

WORKDIR /react-app
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# Stage 2
FROM nginx:1.17.0-alpine

COPY --from=build-stage /react-app/dist /usr/share/nginx/html
EXPOSE $REACT_DOCKER_PORT

CMD nginx -g 'daemon off;'
# FROM node:18.13.0

# WORKDIR /app

# COPY package.json .
# RUN npm i

# COPY . .

# RUN npm run build

# EXPOSE $REACT_DOCKER_PORT

# CMD ["npm", "run", "preview"]