resource "github_repository_environment" "github_repository_environment_runner" {
  environment = local.github_env_name
  repository  = var.github.repository
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

module "github_environment_runner_secrets" {
  source = "git::https://github.com/pagopa/github-actions-tf-modules//github-environment-secrets?ref=v1.0.0"


  github_repository                  = "devops-app-status"
  github_repository_environment_name = local.github_env_name

  secrets = {
    "AZURE_TENANT_ID" : data.azurerm_client_config.current.tenant_id,
    "AZURE_SUBSCRIPTION_ID" : data.azurerm_subscription.current.subscription_id,
    "AZURE_CLIENT_ID" : module.github_runner_aks.client_id,
    "AZURE_CONTAINER_APP_ENVIRONMENT_NAME" : local.container_app_github_runner_env_name,
    "AZURE_RESOURCE_GROUP_NAME" : local.container_app_github_runner_env_rg,
  }
}
