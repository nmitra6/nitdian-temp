FROM node:12-alpine

# create destination directory
RUN mkdir -p /usr/src/nitdian-temp
WORKDIR /usr/src/nitdian-temp

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

# copy the app, note .dockerignore
COPY . /usr/src/nitdian-temp
RUN npm install

# build necessary, even if no static files are needed,
# since it builds the server as well
# RUN node app.js

# expose 5000 on container
EXPOSE 4000

# start the app
CMD [ "NODE_ENV=production node", "app.js" ]
