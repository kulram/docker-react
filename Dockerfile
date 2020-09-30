FROM node:alpine
WORKDIR /var/app

COPY ./package.json .
RUN npm install
COPY ./public ./public
COPY ./src ./src
RUN npm run build

FROM nginx:alpine
EXPOSE 80

COPY --from=builder /var/app/build /usr/share/nginx/html
