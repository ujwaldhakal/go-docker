### Docker boilerplate

This repository is a Docker boilerplate for GO development and production.

#### Usage
* Copy `Dockerfile` and `docker-compose.yml` to your project root. (Update the name of container if you want)
* For development run `docker-compose up` to start up the container which uses [air](https://github.com/cosmtrek/air) to hot reload
* For production use `prod` target to get the smaller uses with `docker build -t GiveImageName . --target prod `
