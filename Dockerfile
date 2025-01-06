# Build stage
FROM golang:1.23.4-alpine3.21 AS builder
WORKDIR /build

# Add necessary build tools
RUN apk add --no-cache make build-base

# Install dependencies first (better layer caching)
COPY go.mod go.sum ./
RUN echo "📦 Installing dependencies..." && \
    go mod download

# Copy source code
COPY . .

# Build the application
RUN echo "🔨 Building application..." && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
    -ldflags='-w -s -extldflags "-static"' \
    -o status-service

# Security scan (optional but recommended)
RUN echo "🔍 Running security checks..." && \
    go vet ./...

# Final stage
FROM alpine:3.21.0
WORKDIR /app

# Add non-root user
RUN echo "🔒 Creating non-root user..." && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup

# Copy binary from builder
COPY --from=builder /build/status-service .

# Set ownership
RUN chown -R appuser:appgroup /app

# Use non-root user
USER appuser

# Container configuration
EXPOSE 8080
ENV TZ=Europe/Rome \
    APP_USER=appuser

# Health checks for all endpoints
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/ && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/status && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/info && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/ping && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/health && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/healthz && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/livez && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/readyz && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/metrics && \
        wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/info || exit 1

# Run application
CMD echo "🚀 Starting status-service..." && \
    ./status-service
