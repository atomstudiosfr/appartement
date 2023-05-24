### STAGE 1: Base ###
FROM node:16-alpine AS base
WORKDIR /usr/src/app
COPY package.json app/package-lock.json ./
RUN npm ci --legacy-peer-deps
COPY app .
RUN npm run build


### STAGE 2: Run ###
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=base /usr/src/app/build /usr/share/nginx/html
