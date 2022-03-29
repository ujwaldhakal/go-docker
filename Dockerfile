FROM golang:1.16 as base


FROM base as dev
WORKDIR /app
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

CMD ["air"]

FROM base as prod
WORKDIR /app
COPY . .
RUN go env -w GO111MODULE=on

RUN go build -o bin/test

CMD go run bin/test