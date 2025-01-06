# devops-app-status

## Goal

A simple http server that allows testing basic endpoints to verify that kubernetes and the namespace are reachable.

Available endpoints:

* `/` - Basic health check
* `/status` - Status check
* `/info` - Status information
* `/ping` - Status check
* `/health` - Health check
* `/healthz` - Kubernetes health probe
* `/livez` - Kubernetes liveness probe
* `/readyz` - Kubernetes readiness probe
* `/actuator/health` - Spring Boot-style health endpoint
* `/actuator/metrics` - Spring Boot-style metrics endpoint
* `/actuator/info` - Spring Boot-style info endpoint

All endpoints return a JSON response: `{"result": "ok"}` with HTTP 200 status code.

## Default port 8080

The default port is `8080`

## Security

* no user root enabled
* alpine version
