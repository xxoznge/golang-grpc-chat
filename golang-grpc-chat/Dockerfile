FROM golang:1.23.0-alpine AS builder
WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN go build -x -v -o grpc-chat-server ./cmd/server/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/grpc-chat-server .
EXPOSE 50051
CMD ["./grpc-chat-server"]
