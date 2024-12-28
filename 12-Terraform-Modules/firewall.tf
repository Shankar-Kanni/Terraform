resource "google_compute_firewall" "fw-ssh" {
  name = "fw-allow-ssh-22"
  #network       = google_compute_network.myvpc.id
  network = module.vpc.network_id
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

resource "google_compute_firewall" "fw-http" {
  name = "fw-allow-ssh-80"
  #network       = google_compute_network.myvpc.id
  network = module.vpc.network_id
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-tag"]
}