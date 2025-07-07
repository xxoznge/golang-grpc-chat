FROM golang:1.23-alpine AS builder

WORKDIR /app

# go.mod와 go.sum을 명시적으로 복사
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# 전체 소스 복사
COPY . .

RUN go build -o ws-proxy main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/ws-proxy .
EXPOSE 8080
CMD ["./ws-proxy"]
