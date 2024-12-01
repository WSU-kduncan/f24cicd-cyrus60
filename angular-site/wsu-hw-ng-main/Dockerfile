FROM node:18-bullseye

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install -g @angular/cli@15.0.3

RUN npm install

CMD ["ng", "serve", "--host", "0.0.0.0"]


