output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

output "service_principal_github_action_name" {
  value = module.github_runner_aks.display_name
}

output "service_principal_github_action_client_id" {
  value = module.github_runner_aks.client_id
}
