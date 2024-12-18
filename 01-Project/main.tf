provider "google" {
  project = "terra-55091"
  region = "us-central1"
}

resource "google_compute_network" "myvpc" {
  name = "myvpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "mysubnet" {
  name = "subnet1"
  region = "us-central1"
  ip_cidr_range = "10.128.0.0/24"
  network = google_compute_network.myvpc.id
}

resource "google_compute_instance" "my-instance" {
  name = "my-instance"
  machine_type = "e2-small"
  zone = "us-central1-a"
boot_disk {
  initialize_params {
    image = "debian-cloud/debian-11"
  
  }
}
  network_interface {
    network = "projects/terra-55091/global/networks/myvpc"
    subnetwork_project =  "terra-55091"
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
      
    }

  }

}