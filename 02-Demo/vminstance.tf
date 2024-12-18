resource "google_compute_instance" "myinstance" {
  name = "myinstance"
  machine_type = "e2-micro"
  zone = "us-central1-a"
  tags = [ tolist(google_compute_firewall.fw-ssh.target_tags)[0],tolist(google_compute_firewall.fw-http.target_tags)[0] ]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")
  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
      
    }
  }
}