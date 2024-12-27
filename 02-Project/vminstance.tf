resource "google_compute_instance" "myinstance" {
  name         = "myinstance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = [tolist(google_compute_firewall.fw-ssh.target_tags)[0], tolist(google_compute_firewall.fw-http.target_tags)[0]]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  metadata_startup_script = file("${path.module}/startup.sh")
  # metadata_startup_script = <<-EOF
  #     #!/bin/bash
  #     sudo apt update
  #     sudo apt install -y telnet
  #     sudo apt-get install -y kubectl
  #     sudo apt-get install -y google-cloud-sdk-gke-gcloud-auth-plugin
  #     sudo apt update
  #     sudo apt install -y gnupg software-properties-common
  #     curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  #     echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  #     sudo apt update
  #     sudo apt install -y terraform
  #   EOF
  network_interface {
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {

    }
  }
}