FROM node:12-alpine

# create destination directory
RUN mkdir -p /usr/src/nitdian-temp
WORKDIR /usr/src/nitdian-temp

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

RUN npm install && npm cache clean --force
# copy the app, note .dockerignore
COPY ./ /usr/src/nitdian-temp

ENV NODE_ENV production

ENV PORT 4000
# build necessary, even if no static files are needed,
# since it builds the server as well
# RUN node app.js

# expose 5000 on container
EXPOSE 4000

# entrypoint
#ENTRYPOINT: []

# start the app
CMD [ "node", "app.js" ]
