FROM golang:latest AS builder
WORKDIR /go/src/http
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o http .

FROM scratch
COPY --from=builder /go/src/http/http .
CMD ["./http"]
