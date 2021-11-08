FROM golang:latest as build-env

WORKDIR /go/src/app
COPY main.go .

RUN go mod init
RUN go get -d -v ./...

# Detaails on when to utilize cgo: 
#   https://pkg.go.dev/cmd/cgo  
RUN CGO_ENABLED=0 go build -o /go/bin/app

# Details on when to use Distroless Base vs Static:
#   https://github.com/GoogleContainerTools/distroless/blob/main/base/README.md
#FROM gcr.io/distroless/base
FROM gcr.io/distroless/static

COPY --from=build-env /go/bin/app /
CMD ["/app"]
