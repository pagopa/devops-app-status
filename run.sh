#!/bin/bash

echo "Building Go application..."
go build -o status-service

echo "Starting server on port 8000..."
./status-service
