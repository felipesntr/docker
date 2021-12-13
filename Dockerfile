FROM golang:alpine as builder
WORKDIR /go/src
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/server main.go

FROM scratch
COPY --from=builder /go/bin/server /server
EXPOSE 8080
CMD ["/server"]
