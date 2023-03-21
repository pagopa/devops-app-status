# .identity

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.30.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.45.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 5.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_environment_runner_secrets"></a> [github\_environment\_runner\_secrets](#module\_github\_environment\_runner\_secrets) | git::https://github.com/pagopa/github-actions-tf-modules//github-environment-secrets | v1.0.0 |
| <a name="module_github_runner_aks"></a> [github\_runner\_aks](#module\_github\_runner\_aks) | ./modules/app-github-runner-aks | n/a |

## Resources

| Name | Type |
|------|------|
| [github_repository_environment.github_repository_environment_runner](https://registry.terraform.io/providers/integrations/github/5.18.0/docs/resources/repository_environment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.45.0/docs/data-sources/subscription) | data source |
| [github_organization_teams.all](https://registry.terraform.io/providers/integrations/github/5.18.0/docs/data-sources/organization_teams) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_app_github_runner_env_name"></a> [container\_app\_github\_runner\_env\_name](#input\_container\_app\_github\_runner\_env\_name) | Container app env name dedicated for github runners | `string` | n/a | yes |
| <a name="input_container_app_github_runner_env_rg"></a> [container\_app\_github\_runner\_env\_rg](#input\_container\_app\_github\_runner\_env\_rg) | Container app resource group env dedicated for github runners | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | n/a | yes |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | n/a | `string` | n/a | yes |
| <a name="input_github"></a> [github](#input\_github) | GitHub Organization and repository name | <pre>object({<br>    org        = string<br>    repository = string<br>  })</pre> | n/a | yes |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | GitHub Organization and repository name | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_principal_github_action_client_id"></a> [service\_principal\_github\_action\_client\_id](#output\_service\_principal\_github\_action\_client\_id) | n/a |
| <a name="output_service_principal_github_action_name"></a> [service\_principal\_github\_action\_name](#output\_service\_principal\_github\_action\_name) | n/a |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | n/a |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
