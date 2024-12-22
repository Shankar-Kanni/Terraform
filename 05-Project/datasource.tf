data "google_compute_zones" "available" {
  status = "UP"
}


output "compute_zone" {
  value = data.google_compute_zones.available.names
}