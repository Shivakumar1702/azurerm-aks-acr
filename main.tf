terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.84.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.location
  location            = azurerm_resource_group.rg.location
  sku                 = var.sku_type

}

resource "azurerm_kubernetes_cluster" "akscluster" {
  name                      = var.cluster_name
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  dns_prefix                = var.dns_name
  automatic_channel_upgrade = var.upgrade_type
  kubernetes_version        = "1.27"
  sku_tier                  = var.sku_tier

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.default_node_pool_count
    vm_size             = var.default_node_pool_vm_size
    enable_auto_scaling = var.enable_auto_scaling

  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy

  }

  tags = {
    Environment = var.tags
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_container_registry.acr]

}

resource "azurerm_kubernetes_cluster_node_pool" "usernodepool" {
  name                  = var.user_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.akscluster.id
  vm_size               = var.user_node_vm_size
  node_count            = var.user_node_count
  enable_auto_scaling   = var.user_node_autoscaling

  depends_on = [azurerm_kubernetes_cluster.akscluster]
}

resource "azurerm_role_assignment" "role" {
  principal_id                     = azurerm_kubernetes_cluster.akscluster.kubenet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
  depends_on                       = [azurerm_container_registry.acr, azurerm_kubernetes_cluster.akscluster]

}