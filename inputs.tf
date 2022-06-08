variable "name" {
  description = "Set names for resources in this deployment."
  type        = string
  default     = "tfworkshop-crayon"
}

variable "vm_password" {
  description = "Admin password used for VM deployment."
  type        = string
  sensitive   = true
}
