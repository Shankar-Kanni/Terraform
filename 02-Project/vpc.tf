resource "google_compute_network" "myvpc" {
  name                    = "myvpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "mysubnet" {
  name          = "mysubnet"
  region        = "us-central1"
  ip_cidr_range = "10.128.0.0/24"
  network       = google_compute_network.myvpc.id
}