module "gke_cluster" {
  source           = "./modules/gke-cluster"
  gke_cluster_name = "${local.name}-gke-autopilot"
  gcp_region       = var.gcp_region

  # Autopilot Cluster
  autopilot_enabled = true

  # Network
  network    = google_compute_network.myvpc.self_link
  subnetwork = google_compute_subnetwork.mysubnet.self_link

  deletion_protection = false

  # Private Cluster Configurations
  enable_private_endpoint = false
  enable_private_nodes    = true
  master_ipv4_cidr_block  = var.master_ip_range

  # IP Address Ranges
  pods_ip_range     = google_compute_subnetwork.mysubnet.secondary_ip_range[0].range_name
  services_ip_range = google_compute_subnetwork.mysubnet.secondary_ip_range[1].range_name

  # Allow access to Kubernetes master API Endpoint
  master_authorized_ip_range      = "0.0.0.0/0"
  master_authorized_ip_range_name = "entire-internet"
}