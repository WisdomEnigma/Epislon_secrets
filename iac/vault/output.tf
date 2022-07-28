

# vaults_secrets is a stdin way to read input or any value
output "vault_secrets" {
  description = "vault have secrets which is unlocked any user who have credentials"
  value       = var.vsecret
  sensitive   = true
}