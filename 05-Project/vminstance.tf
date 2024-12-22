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

# For each set value
/*
resource "google_compute_instance" "myinstance" {
  for_each = toset(data.google_compute_zones.available.names)
  name = "myinstance-vm-${each.key}"
  machine_type = var.machine_type
  zone = each.key
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

*/


# For each with map values
/*
variable "zone_machine_map" {
  type = map(string)
  default = {
    "us-central1-a" = "e2-micro"
    "us-central1-b" = "e2-small"
    "us-central1-c" = "e2-medium"
  }
}

resource "google_compute_instance" "myinstance" {
  for_each = var.zone_machine_map
  name = "myinstance-vm-${each.key}"
  machine_type = each.value
  zone = each.key
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
*/