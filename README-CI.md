# Part 1

## Project overview
The point of this project is to user Docker, a container engine/application used to containerize applications to containerize an already made angular JS application. The advantages of containerization are multiple, including to centralize all necesarry software dependancies in a single unit, allowing for the ease of replication of the software across different hardware. 

## Containerizing your Application
To install Docker on wsl ubuntu, simply run the command `sudo apt install docker.io`. To install Docker desktop on windows, (which is also required), navigate to this [link](https://www.docker.com/products/docker-desktop/) and select the download for your operating system.

To build a container that runs the angular site, simply make sure npm and node are installed correctly, install the angular cli `npm install -g @angular/cli`, and run the command `ng serve --host 0.0.0.0` inside of the angular application folder.

`FROM node:18-bullseye` specifies which software image to include in the container

`WORKDIR /usr/src/app` establishes the working directory of the container

`COPY . /usr/src/app` copies the files from the directory of the Dockerfile into `/usr/src/app`

`RUN npm install -g @angular/cli@15.0.3` installs the necesarry angular cli for the application.

`RUN npm install` installs any necesarry node modules

`CMD ["ng", "serve", "--host", "0.0.0.0"]` starts the angular application on local host

To build an image from the `Dockerfile`, simply run command `docker build -t [USERNAME/REPONAME]` inside of the same repository as the `Dockerfile`

To run a container from the image that was built, run the command `docker run -p [PORTNUMBER] [REPONAME]`

To view the application running from the container, simply navigate to `https://localhost:[PORTNUMBER]` in a browser

## Working with DockerHub
To create a public repo in DockerHub, navigate to [here](https://hub.docker.com), log in, and simply select create a repository in the top right. Simply name the repository and ensure that public is selected, and create.

To push your container image to DockerHub, simply ensure that your image name matches the [username]/[reponame] format by using the command `docker images`. If your image name matches your DockerHub username and repository name format, run the command `docker push [username]/[reponame]` to push your image to the DockerHub. 

[Link to DockerHub repo](https://hub.docker.com/repository/docker/cyrus60/straley-ceg3120/general)
	

# Part 2

## Configuring GitHub secrets
To set a secret for use by GitHub actions, simply navigate to your repository settings, scroll to the botton left of the settings, select sercrets and variables, and then actions from the drop down menu. Here you can setup your specific secrets

The secrets setup for this project are DOCKER_USERNAME which contains the username to your DockerHub account, and DOCKER_TOKEN which contains the token to your DockerHub account.

## Behavior of GitHub workflow

