resource "google_compute_firewall" "fw_ssh" {
  name = "fw_allow_ssh_22"
  network = google_compute_network.myvpc.id
  allow {
    ports = [ "22" ]
    protocol = "tcp"
  }
  direction = "INGRESS"
  source_ranges = "0.0.0.0/0"
  target_tags = [ "ssh_tag" ]
}

resource "google_compute_firewall" "fw_http" {
  name = "fw_allow_ssh_8080"
  network = google_compute_network.myvpc.id
  allow {
    ports = [ "8080" ]
    protocol = "tcp"
  }
  direction = "INGRESS"
  source_ranges = "0.0.0.0/0"
  target_tags = [ "http_tag" ]
}