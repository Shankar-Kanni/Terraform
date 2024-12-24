# Terraform Datasources
# Datasource: Get a list of Google Compute zones that are UP in a region
data "google_compute_zones" "available" {
  status = "UP"
}
#Output values
output "compute_zones" {
  description = "List of available zone in the specified region"
  value       = data.google_compute_zones.available.names
}