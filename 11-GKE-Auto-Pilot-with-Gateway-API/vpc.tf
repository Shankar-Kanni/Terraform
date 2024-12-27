resource "google_compute_network" "myvpc" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}

#Subnet

resource "google_compute_subnetwork" "mysubnet" {
  name                     = "${local.name}-${var.gcp_region1}-mysubnet"
  network                  = google_compute_network.myvpc.id
  region                   = var.gcp_region1
  ip_cidr_range            = var.subnet_ip_range
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "kubernetes-pod-range"
    ip_cidr_range = var.pods_ip_range
  }

  secondary_ip_range {
    range_name    = "kubernetes-services-range"
    ip_cidr_range = var.services_ip_range
  }
}

resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name             = "${local.name}-${var.gcp_region1}-regional-proxy-subnet"
  region           = var.gcp_region1
  ip_cidr_range    = "10.142.0.0/24"
  purpose          = "REGIONAL_MANAGED_PROXY"
  network          = google_compute_network.myvpc.id
  role             = "ACTIVE"
}

#Outputs

output "vpc_id" {
  value = google_compute_network.myvpc.id
}

output "vpc_selflink" {
  value = google_compute_network.myvpc.self_link
}

output "mysubnet_id" {
  value = google_compute_subnetwork.mysubnet.id
}
output "regional_proxy_subnet_id" {
  value = google_compute_subnetwork.regional_proxy_subnet.id 
}