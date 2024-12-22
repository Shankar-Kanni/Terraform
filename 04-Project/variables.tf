variable "gcp_project" {
  description = "Project in which GCP Resources to be created"
  type        = string
  default     = "terra-55091"
}

# GCP Region
variable "gcp_region1" {
  description = "Region in which GCP Resources to be created"
  type        = string
  default     = "us-east1"
}

# GCP Compute Engine Machine Type
variable "machine_type" {
  description = "Compute Engine Machine Type"
  type        = string
  default     = "e2-small"
}
