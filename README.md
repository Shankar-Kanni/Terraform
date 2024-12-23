# Terraform



1. **terraform init** # _To initialize the provide and download the required plugin_
2. **terraform validate** # _To validate the terraform files if they are syntactically correct_
3. **terraform plan** # _To create a plan and see what terraform is going to build for us_
4. **terraform apply -auto-approve** # _To create the resources on cloud using the terraform files._
5. **terraform destory -auto-approve** # _To destory the infra that was created already_
6. **terraform state list** # _To list the resources that are cleared as part of terraform_
```t
$ terraform.exe state list
google_compute_network.myvpc
google_compute_subnetwork.mysubnet1
google_compute_subnetwork.mysubnet2
```

7. **terraform state show google_compute_network.myvpc**
```t
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
```
```t
git filter-branch --force --index-filter    'git rm -r --cached --ignore-unmatch 04-Project/.terraform*'    --prune-empty --tag-name-filter cat -- --all
```

