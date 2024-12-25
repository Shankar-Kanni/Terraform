resource "google_compute_firewall" "fw_ssh" {
  name    = "${local.name}-firewall-allow-ssh-22"
  network = google_compute_network.myvpc.id
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction = "INGRESS"
  priority  = 1000
  # source_ranges = ["0.0.0.0/0"]
  source_ranges = ["35.235.240.0/20"] # IAP IP Range
  target_tags   = ["ssh-tag"]
}