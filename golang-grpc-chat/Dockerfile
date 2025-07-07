# golang-grpc-chat/Dockerfile

FROM golang:1.20-alpine AS builder
WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

# 필요시 main.go 경로 수정
RUN go build -o grpc-chat-server main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/grpc-chat-server .
EXPOSE 50051
CMD ["./grpc-chat-server"]
