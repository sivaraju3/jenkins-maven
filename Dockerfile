FROM node:16-bullseye AS builder
RUN mkdir /node-app
WORKDIR /node-app
COPY package.json .
RUN npm install
COPY . .
RUN npm install -g @angular/cli
RUN ng build


FROM httpd
COPY --from=builder /node-app/dist/angularCalc /usr/local/apache2/htdocs
