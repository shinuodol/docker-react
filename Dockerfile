FROM node:alpine as builder
WORKDIR "/var/project/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /var/project/app/build /usr/share/nginx/html