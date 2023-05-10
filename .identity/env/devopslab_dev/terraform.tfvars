prefix    = "dvopla"
env_short = "d"
env       = "dev"

github = {
  org        = "pagopa"
  repository = "devops-app-status"
}

github_repository_environment_ci = {
  protected_branches     = false
  custom_branch_policies = true
}

github_repository_environment_cd = {
  protected_branches     = false
  custom_branch_policies = true
  reviewers_teams        = ["infrastructure-admins"]
}

#
# Container app
#
container_app_github_runner_env_name = "dvopla-d-neu-core-github-runner-cae"
container_app_github_runner_env_rg   = "dvopla-d-neu-core-github-runner-rg"

aks_name= "dvopla-d-neu-dev01-aks"
aks_resource_group= "dvopla-d-neu-dev01-aks-rg"
