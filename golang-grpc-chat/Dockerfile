# 빌드 단계
FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o grpc-chat-server main.go  # main.go 경로 확인

# 런타임 단계
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/grpc-chat-server .
EXPOSE 50051
CMD ["./grpc-chat-server"]
