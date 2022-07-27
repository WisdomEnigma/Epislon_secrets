
# consul provider get terraform package to create consul iac object. Each consul object have so many parameters but required parameters are
# address, scheme and datacenter
provider "consul" {

  address    = var.consul_local_address
  scheme     = var.consul_scheme
  datacenter = var.consul_datacenter
}


