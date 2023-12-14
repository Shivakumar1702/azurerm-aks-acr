variable "rg_name" {
  type        = string
  description = "The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."

}

variable "rg_location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."

}

variable "acr_name" {
  type        = string
  description = "Specifies the name of the Container Registry. Only Alphanumeric characters allowed. Changing this forces a new resource to be created."

}

variable "sku_type" {
  type        = string
  default     = "Basic"
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium."

}

variable "cluster_name" {
  type        = string
  default     = "cluster-example-001"
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."

}

variable "dns_name" {
  type        = string
  default     = "mydns"
  description = "DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length. Changing this forces a new resource to be created."

}

variable "upgrade_type" {
  type        = string
  default     = "none"
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none."

}

variable "sku_tier" {
  type        = string
  default     = "Free"
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free."

}

variable "default_node_pool_name" {
  type        = string
  default     = "example-node-pool"
  description = "The name which should be used for the default Kubernetes Node Pool."

}

variable "default_node_pool_count" {
  type        = number
  default     = 1
  description = "Number of VMs in the default node pool."

}

variable "default_node_pool_vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "The size of the Virtual Machine, such as Standard_DS2_v2"

}

variable "enable_auto_scaling" {
  type        = bool
  default     = false
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool?"

}

variable "network_plugin" {
  type        = string
  default     = "kubenet"
  description = "Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created."

}

variable "network_policy" {
  type        = string
  default     = "calico"
  description = "Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico, azure and cilium."

}

variable "tags" {
  type        = string
  default     = "production"
  description = "To add the tags Kubernetes clusters"

}

variable "user_node_pool_name" {
  type        = string
  default     = "example-user-node-pool"
  description = "Number of VMs in the user node pool."

}

variable "user_node_vm_size" {
  type        = string
  default     = 1
  description = "Number of VMs in the user node pool."

}

variable "user_node_count" {
  type        = string
  default     = 1
  description = "Number of VMs in the user node pool."

}

variable "user_node_autoscaling" {
  type        = bool
  default     = false
  description = "Should the Kubernetes Auto Scaler be enabled for this User Node Pool?"

}