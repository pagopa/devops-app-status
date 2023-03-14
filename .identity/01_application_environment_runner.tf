module "github_runner_aks" {
  source = "./modules/app-github-runner-aks"

  app_name = "${local.app_name}-aks"

  subscription_id = data.azurerm_subscription.current.id

  github_org              = var.github.org
  github_repository       = var.github.repository
  github_environment_name = local.github_env_name

  container_app_github_runner_env_rg = local.container_app_github_runner_env_rg

}
