# Part 1 - Semantic versioning 

## Project overview
This project uses github actions and semantic versioning to coninuously deploy version tagged docker images on an aws server. 

## Generating/pushing tag in git
To generate a tag in git, simply make the commit that you want to be tagged, use the command `git tag <tagname>`, and to push the tag use the command `git push origin <tagname>`
