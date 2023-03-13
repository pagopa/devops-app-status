locals {
  project  = "${var.prefix}-${var.env_short}"
  app_name = "github-${var.github.org}-${var.github.repository}-${var.env}"
  github_env_name = "${var.env}-aks"


  #
  # Container app
  #
  container_app_github_runner_env_name = "dvopla-d-neu-core-github-runner-cae"
  container_app_github_runner_env_rg   = "dvopla-d-neu-core-github-runner-rg"
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
