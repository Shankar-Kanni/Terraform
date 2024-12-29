# Resource : GKE Cluster
resource "google_container_cluster" "gke_cluster" {
  name = var.gke_cluster_name
  location = var.gcp_region

  #Autopilot settings
  enable_autopilot = var.autopilot_enabled

  #Network
  network = var.network
  subnetwork = var.subnetwork

  # Deletion protections
  deletion_protection = var.deletion_protection

  private_cluster_config {
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes = var.enable_private_nodes
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }

  ip_allocation_policy {
    cluster_secondary_range_name = var.pods_ip_range
    services_secondary_range_name = var.services_ip_range
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.master_authorized_ip_range
      display_name = var.master_authorized_ip_range_name
    }
  }
}