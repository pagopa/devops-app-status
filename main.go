package main

import (
	"log"
	"net/http"

	"status-service/handlers"

	"github.com/gorilla/mux"
)

func main() {
	const web_port = ":8080"
	r := mux.NewRouter()

	r.HandleFunc("/", handlers.HomeHandler)
	r.HandleFunc("/status", handlers.StatusHandler)
	r.HandleFunc("/health", handlers.HealthHandler)
	r.HandleFunc("/healthz", handlers.HealthzHandler)

	log.Printf("Server starting on port %s", web_port)
	log.Fatal(http.ListenAndServe(web_port, r))
}
