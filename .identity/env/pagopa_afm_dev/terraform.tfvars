prefix    = "pagopa"
env_short = "d"
env       = "dev"
domain    = "afm"

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
container_app_github_runner_env_name = "pagopa-d-weu-github-runner-cae"
container_app_github_runner_env_rg   = "pagopa-d-weu-github-runner-rg"

aks_name= "pagopa-d-weu-dev-aks"
aks_resource_group= "pagopa-d-weu-dev-aks-rg"
