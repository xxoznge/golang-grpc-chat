FROM golang:1.24.3-alpine AS builder

WORKDIR /app

# go.mod와 go.sum을 복사
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# 전체 소스 복사
COPY . .

# ws-proxy 디렉토리로 이동해서 빌드
WORKDIR /app/ws-proxy
RUN go build -o ws-proxy main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/ws-proxy/ws-proxy .
EXPOSE 8080
CMD ["./ws-proxy"]
