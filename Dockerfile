FROM golang:1.16 as base


FROM base as dev

WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin"

CMD ["air"]

FROM base as build

WORKDIR /app

COPY . /app/

RUN go env -w GO111MODULE=on && go build -o app


FROM alpine:3.11.3 as prod

WORKDIR /app

COPY --from=build /app/app .

CMD ["./app"]