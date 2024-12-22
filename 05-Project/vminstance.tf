resource "google_compute_instance" "myinstance" {
  count = 2
  name = "myinstance-vm-${count.index}"
  machine_type = var.machine_type
  zone = data.google_compute_zones.available.names[count.index]
  tags = [ tolist(google_compute_firewall.fw-ssh.target_tags)[0],tolist(google_compute_firewall.fw-http.target_tags)[0] ]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")
  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet1.id
    access_config {
      
    }
  }
}