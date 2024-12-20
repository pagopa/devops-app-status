package it.pagopa.status.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatusController {

    @GetMapping("/")
    public ResponseEntity<Void> home() {
        return ResponseEntity.ok().build();
    }

    @GetMapping("/status")
    public ResponseEntity<Void> status() {
        return ResponseEntity.ok().build();
    }

    @GetMapping("/health")
    public ResponseEntity<Void> health() {
        return ResponseEntity.ok().build();
    }

    @GetMapping("/healthz")
    public ResponseEntity<Void> healthz() {
        return ResponseEntity.ok().build();
    }
}