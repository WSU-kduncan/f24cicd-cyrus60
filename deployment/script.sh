#!/bin/sh

sudo docker stop Birds

sudo docker rm Birds

sudo docker pull cyrus60/straley-ceg3120:latest

sudo docker run -d --name Birds --restart always -p 80:4200 cyrus60/straley-ceg3120:latest
