FROM node:alpine as builder 
WORKDIR /var/app

COPY ./package.json .
RUN npm install
COPY ./public ./public
COPY ./src ./src
RUN npm run build

FROM nginx:alpine

COPY --from=builder /var/app/build /usr/share/nginx/html
