
# Download external terraform providers package. Each package require version and source.
# source = "which package you want?"; version = "versioning control (vc)" 
terraform {
  required_providers{ 
        vaultoperator = {
            version =  "0.1.5"
            source = "rickardgranberg/vaultoperator"
        }
    }
}


# After import vaultoperator will be configure. vault_addr require field
provider "vaultoperator"{
    vault_addr = var.vault_local_address
}


# vault is a package not a provider package which means it will instakk directly and configure through parameters.
provider "vault" {

  address               = var.vault_local_address
  max_lease_ttl_seconds = var.vault_max_ttl  
  token = var.vsecret
  
}

# vaultoperator int hold secrets upper value . This will be helpful during vault credentials compilation

resource "vaultoperator_init" "unseal" {
  secret_shares    = 5
  secret_threshold = 3
}


# vault mount allow to write data on vault server
resource "vault_mount" "mount" {
  
#   namespace = vault_dir.secret_path.path

  path = "kvv1"
  type      = "kv"
  options = {
        version = "1"
  }
}



# vault generic secrets allow to mount path and write data on vault server,
resource "vault_generic_secret" "agent" {
   
   #namespace = vault_mount.mount.namespace
   path = "${vault_mount.mount.path}/secret"
   data_json = jsonencode({
    "key" = "secrets"
   })
}





