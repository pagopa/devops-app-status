package main

import (
	"log"
	"net/http"

	"status-service/handlers"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/", handlers.HomeHandler)
	r.HandleFunc("/status", handlers.StatusHandler)
	r.HandleFunc("/health", handlers.HealthHandler)
	r.HandleFunc("/healthz", handlers.HealthzHandler)

	log.Printf("Server starting on port 8000")
	log.Fatal(http.ListenAndServe(":8000", r))
}
