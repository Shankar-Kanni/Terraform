resource "google_compute_network" "myvpc" {
  name                    = "myvpc"
  project                 = var.gcp_project
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "mysubnet1" {
  region        = var.gcp_region1
  name          = "mysubnet1"
  ip_cidr_range = "10.128.0.0/24"
  network       = google_compute_network.myvpc.id
}

# resource "google_compute_subnetwork" "mysubnet2" {
#   provider = google.europe-west1
#   name = "mysubnet2"
#   ip_cidr_range = "10.132.0.0/24"
#   network = google_compute_network.myvpc.id
# }