# To create custom VPC
resource "google_compute_network" "myvpc" {
  name = "${local.name}-vpc"
  auto_create_subnetworks = false
}

#Subnet

resource "google_compute_subnetwork" "mysubnet" {
    name = "${local.name}-${var.gcp_region1}-mysubnet"
    network = google_compute_network.myvpc.id
    region = var.gcp_region1
    ip_cidr_range = "10.128.0.0/20"
    private_ip_google_access = true
}