terraform {
required_version = ">= 1.10.2"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 6.14.0"
    }
  }
}

provider "google" {
  project = "vars.gcp_project"
  region = "us-central1"
  alias = "us-central1"
}

provider "google" {
  project = "vars.gcp_project"
  region = "europe-west1"
  alias = "europe-west1"
}

