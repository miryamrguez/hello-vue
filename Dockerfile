
FROM node:lts-buster as nodebuild
WORKDIR /build/
COPY . /build/
#RUN npm install
RUN yarn
#RUN npm run build
RUN yarn run build

FROM nginx
COPY --from=nodebuild /build/dist/ /usr/share/nginx/html/
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]