terraform {
  required_version = ">= 1.10.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.14.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-on-gcp-gke-auto-cluster"
    prefix = "dev/gke-private-cluster-private-endpoint"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region1
}
