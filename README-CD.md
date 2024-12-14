# Part 1 - Semantic versioning 

## Project overview
This project uses github actions, semantic versioning, and webhooks to continuously deploy version tagged containerized web applications on an aws instance. 

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

[script](https://github.com/WSU-kduncan/f24cicd-cyrus60/blob/master/deployment/script.sh) 

## Purpose of adnanh's `webhook`
The purpose of installing this webhook software to the instance is to have a webhook service that will listen on port 9000 and handle any processing necesarry once the endpoint is hit. To install this software, run the command `sudo apt install webhook`.

## Webhook / hook task definition file
The hook task definition file signifies which endpoint to run the hook on (id), which commands (scripts) to run once the endpoint is hit (execute-command), and which directory the hook will work out of (command-working-directory). 

The location of my task definition file on my instance is /home/ubuntu/hooks.json

[task definition file](https://github.com/WSU-kduncan/f24cicd-cyrus60/blob/master/deployment/hooks.json)

## How to start `webhook` listening
To initiate the webhook to listen, run the command `webhook -hooks <path_to_json>`

## How to test listener
To test that the listener functions and triggers the script succesfully, run the command above with the -verbose flag. Now that the hook is listening, navigate to `[IP_OF_INSTANCE]:9000/hooks/[HOOK_ID]` in your browser. Once this endpoint is hit, open the terminal of the instance that the hook is listening on, and you should see output of commands being ran by the hook. To ensure that the script worked correctly and started an updated container, simply run the command `docker ps` and a container should show as having been run since the webhook endpoint was hit.

## How to configure DockerHub to message the listener
To setup the webhook through DockerHub, navigate to the webhooks section of your repository on DockerHub. From there, simply give the webhook a name, and paste the url (`[IP_OF_INSTANCE]:9000/hooks/[HOOK_ID]`) to the exact webhook endpoint that was just used in testing.

## How to modify or create a webhook service file
To modify the service file such that the listener runs upon system startup, navigate to `/usr/lib/systemd/system/webhook.service`, and alter the path to your hooks file in the `ConditionPathExists` and `ExecStart` fields.

[service file](https://github.com/WSU-kduncan/f24cicd-cyrus60/blob/master/deployment/webhook.service)

# Part 3 - Diagramming
