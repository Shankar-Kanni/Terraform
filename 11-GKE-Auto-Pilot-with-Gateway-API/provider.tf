data "terraform_remote_state" "gke" {
  backend = "gcs"
  config = {
    bucket = "terraform-on-gcp-gke-cluster"
    prefix = "dev/gke-autopilot-cluster-gateway-api"
  }
}

output "p1_vpc_id" {
  value = data.terraform_remote_state.gke.outputs.vpc_id
}

output "p1_vpc_self_link" {
  value = data.terraform_remote_state.gke.outputs.vpc_selflink
}

output "p1_mysubnet_id" {
  value = data.terraform_remote_state.gke.outputs.mysubnet_id
}
