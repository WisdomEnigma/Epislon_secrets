# Vault variables

variable "vault_local_address" {
  type        = string
  default     = "http://127.0.0.1:8200"
  sensitive   = false
  description = "Vault local address for development purpose"
}

variable "vault_max_ttl" {
  type        = string
  default     = "20"
  sensitive   = false
  description = "Vault max ttl (time to live) more concern with requests timeout "
}


variable "vsecret" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Vault secret shared "
}




