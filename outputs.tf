output "client_certificate" {
  value     = azurerm_kubernetes_cluster.akscluster.kube_config.0.client_certificate
  description = "This output gives clinet certificate"
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.akscluster.kube_config_raw
  description = "This output gives the information about kube config"
}