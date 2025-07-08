FROM golang:1.24.3-alpine AS builder

WORKDIR /app
COPY . .           

WORKDIR /app/ws-proxy
RUN go mod tidy
RUN go build -o /app/ws-proxy/ws-proxy main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/ws-proxy/ws-proxy .
EXPOSE 8080
CMD ["./ws-proxy"]