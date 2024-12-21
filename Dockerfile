FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o status-service

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/status-service .
EXPOSE 8000
CMD ["./status-service"]
