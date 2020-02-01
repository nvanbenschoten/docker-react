# Build phase
FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

# Run phase
FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
