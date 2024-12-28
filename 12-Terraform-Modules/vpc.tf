module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "10.0.0"
  # insert the 3 required variables here
  project_id   = var.gcp_project
  network_name = "${local.name}-vpc"

  subnets = [
    {
      subnet_name   = "${local.name}-${var.gcp_region1}-subnet"
      subnet_ip     = "10.128.0.0/20"
      subnet_region = var.gcp_region1
    }
  ]
}
