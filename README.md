# Terraform



1. terraform init
2. terraform validate
3. terraform plan
4. terraform apply -auto-approve
5. terraform destory -auto-approve
6. terraform state list
 terraform.exe state list
google_compute_network.myvpc
google_compute_subnetwork.mysubnet1
google_compute_subnetwork.mysubnet2
===============================
7. terraform state show google_compute_network.myvpc
# terraform.exe state show google_compute_network.myvpc


google_compute_network.myvpc:
resource "google_compute_network" "myvpc" {
    auto_create_subnetworks                   = false
    delete_default_routes_on_create           = false
    description                               = null
    enable_ula_internal_ipv6                  = false
    gateway_ipv4                              = null
    id                                        = "projects/terra-55091/global/networks/myvpc"
    internal_ipv6_range                       = null
    mtu                                       = 0
    name                                      = "myvpc"
    network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
    numeric_id                                = "7511822049188162033"
    project                                   = "terra-55091"
    routing_mode                              = "REGIONAL"
    self_link                                 = "https://www.googleapis.com/compute/v1/projects/terra-55091/global/networks/myvpc"
}


git filter-branch --force --index-filter    'git rm -r --cached --ignore-unmatch 04-Project/.terraform*'    --prune-empty --tag-name-filter cat -- --all

