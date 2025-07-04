FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o ws-proxy main.go  # main.go 경로 확인

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/ws-proxy .
EXPOSE 8080
CMD ["./ws-proxy"]
