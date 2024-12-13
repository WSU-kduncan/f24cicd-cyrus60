# Part 1 - Semantic versioning 

## Project overview
This project uses github actions and semantic versioning to coninuously deploy version tagged docker images on an aws server. 

## Generating/pushing tag in git
To generate a tag in git, simply make the commit that you want to be tagged, use the command `git tag -a <tagname>`, and to push the tag use the command `git push origin <tagname>`

## Behavior of GitHub workflow
The GitHub workflow now only triggers when a valid semver (1.0.0) tag is pushed to the GitHub repository. The GitHUb workflow still signs into DockerHub and  builds and pushes new images. However, this workflow uses the Docker metadata-action to parse version information via the git repository, allowing us to reference this metadata later when pushing the tagged version of DockerHub, now allowing for proper versioning of images and rollbacks if necesarry.

[Link to DockerHub repo](https://hub.docker.com/repository/docker/cyrus60/straley-ceg3120/general)

# Part 2 - Deployment 

## Instance information
Public IP: 34.226.93.85
OS: Ubuntu 20

## `bash` script
The purpose of the bash script is the code that will be executed everytime the webhook endpoint it hit. The code stops the current running container, pulls the new image from DockerHub, and starts a new container with the new image. My bash script on the instance is simply located at `/home/ubuntu/script.sh`. 

## 
