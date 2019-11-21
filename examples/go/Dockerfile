# our builder image
FROM golang:1.13.1-alpine AS builder

# default app directory
WORKDIR /go/src/app

# copy-in our module info
COPY go.mod go.sum /go/src/app/
RUN go mod download

# add our binary sources
ADD . /go/src/app

# build our binary
RUN CGO_ENABLED=0 go build -a -installsuffix cgo -ldflags '-w -s -extldflags "-static"' -o /go/bin/app

# ---

FROM gcr.io/distroless/static

# run as unprivileged user
USER nonroot

 # command / entrypoint of container
CMD ["/app"]

# copy our built binary (chown isn't strictly necessary since USER is already set)
COPY --from=builder --chown=nonroot /go/bin/app /app
