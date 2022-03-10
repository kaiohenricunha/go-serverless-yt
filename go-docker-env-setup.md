# Creating a Go dev environment in a Docker container

- Create a Dockerfile for the Go dev environment
    ```
    FROM golang:1.17-alpine as dev

    WORKDIR /work

    RUN apk update
    RUN apk add git

    RUN apk add bash

    RUN apk add zip unzip

    RUN apk add curl

    RUN git clone https://github.com/kamatama41/tfenv.git ~/.tfenv && \
        ln -s /root/.tfenv/bin/* /usr/local/bin
    RUN tfenv install 1.1.6 && tfenv use 1.1.6
    ```
- Build the Docker image
    ```
    docker build --target dev . -t go
    ```
- Push the Docker image to Docker Hub
    ```
    docker tag go kaiohenricunha/go-dev-environment:1.0
    ```
    ```
    docker push kaiohenricunha/go-dev-environment:1.0
    ```

- Run the Docker image
    ```
    docker run -it -v ${PWD}:/work go sh
    ```