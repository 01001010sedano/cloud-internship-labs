terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  auth_url            = "http://192.168.2.5:5000/v3"
  tenant_name         = "admin"
  user_name           = "admin"
  password            = "keystone"
  region              = "microstack"
  user_domain_name    = "Default"
  project_domain_name = "Default"
}

resource "openstack_networking_network_v2" "terraform_net" {
  name           = "terraform-network"
  admin_state_up = true
}
