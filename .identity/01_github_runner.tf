data "github_organization_teams" "all" {
  root_teams_only = true
  summary_only    = true
}

module "github_runner_aks" {
  source = "git::https://github.com/pagopa/github-actions-tf-modules.git//app-github-runner-creator?ref=main"

  app_name = local.app_name

  subscription_id = data.azurerm_subscription.current.id

  github_org              = var.github.org
  github_repository       = var.github.repository
  github_environment_name = local.github_env_name

  container_app_github_runner_env_rg = var.container_app_github_runner_env_rg
}

locals {
  env_secrets = {
    "AZURE_CLIENT_ID" : module.github_runner_aks.client_id,
    "AZURE_TENANT_ID" : data.azurerm_client_config.current.tenant_id,
    "AZURE_SUBSCRIPTION_ID" : data.azurerm_subscription.current.subscription_id,
  }
  env_variables = {
    "AZURE_CONTAINER_APP_ENVIRONMENT_NAME" : var.container_app_github_runner_env_name,
    "AZURE_CONTAINER_APP_ENVIRONMENT_RESOURCE_GROUP_NAME" : var.container_app_github_runner_env_rg,
    "ENV" : var.env,
    "AKS_NAME" : var.aks_name,
    "AKS_RESOURCE_GROUP" : var.aks_resource_group,
    "AZURE_AD_APPNAME" : local.app_name,
    "DOMAIN": var.domain,
  }
}

resource "github_repository_environment" "github_repository_environment_runner" {
  environment = local.github_env_name
  repository  = var.github.repository
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

resource "github_actions_environment_secret" "github_environment_runner_secrets" {
  for_each        = local.env_secrets
  repository      = var.github.repository
  environment     = local.github_env_name
  secret_name     = each.key
  plaintext_value = each.value

  depends_on = [ github_repository_environment.github_repository_environment_runner ]
}

resource "github_actions_environment_variable" "github_environment_runner_variables" {
  for_each      = local.env_variables
  repository    = var.github.repository
  environment   = local.github_env_name
  variable_name = each.key
  value         = each.value

    depends_on = [ github_repository_environment.github_repository_environment_runner ]

}
