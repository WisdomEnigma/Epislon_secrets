
# These are consul variables that conatin consul credentials
variable "consul_local_address" {
  type        = string
  default     = "127.0.0.1:8500"
  description = "Consul Local Address"
  sensitive   = false
}

variable "consul_scheme" {
  type        = string
  default     = "http"
  description = "Each consul agent have either http scheme or https scheme"
  sensitive   = false
}

variable "consul_datacenter" {
  type        = string
  default     = "dc1"
  description = "Each consul agent have own datacenter"
  sensitive   = false
}

 