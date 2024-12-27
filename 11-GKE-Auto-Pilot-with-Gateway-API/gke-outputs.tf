# Terraform Outputs
output "gke_cluster_name" {
  description = "GKE cluster name"
  value       = google_container_cluster.gke_cluster.name
}

output "gke_cluster_location" {
  description = "GKE Cluster location"
  value       = google_container_cluster.gke_cluster.location
}

output "gke_cluster_endpoint" {
  description = "GKE Cluster Endpoint"
  value       = google_container_cluster.gke_cluster.endpoint
}

output "gke_cluster_master_version" {
  description = "GKE Cluster master version"
  value       = google_container_cluster.gke_cluster.master_version
}

# # Terraform Outputs: nodepool_1
# output "nodepool_1_id" {
#   description = "GKE Linux Node Pool 1 ID"
#   value       = google_container_node_pool.nodepool_1.id
# }
# output "nodepool_1_version" {
#   description = "GKE Linux Node Pool 1 version"
#   value       = google_container_node_pool.nodepool_1.version
# }