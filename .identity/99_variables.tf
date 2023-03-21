locals {
  project         = "${var.prefix}-${var.env_short}"
  app_name        = "github-${var.github.org}-${var.github.repository}-${var.env}"
  github_env_name = "${var.prefix}-${var.env}"
}

variable "prefix" {
  type = string
  validation {
    condition = (
      length(var.prefix) <= 6
    )
    error_message = "Max length is 6 chars."
  }
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "env_short" {
  type = string
  validation {
    condition = (
      length(var.env_short) <= 1
    )
    error_message = "Max length is 1 chars."
  }
}

variable "github" {
  type = object({
    org        = string
    repository = string
  })
  description = "GitHub Organization and repository name"
}

variable "github_token" {
  type        = string
  sensitive   = true
  description = "GitHub Organization and repository name"
}

variable "container_app_github_runner_env_name" {
  type        = string
  description = "Container app env name dedicated for github runners"
}

variable "container_app_github_runner_env_rg" {
  type        = string
  description = "Container app resource group env dedicated for github runners"
}

variable "aks_name" {
  type        = string
  description = "Aks cluster name"
}

variable "aks_resource_group" {
  type        = string
  description = "Aks cluster resource group name"
}
