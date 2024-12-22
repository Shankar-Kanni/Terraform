# Terraform Output Values
## ATTRIBUTES

output "vm_name1" {
  value = google_compute_instance.myinstance[0].name
}

output "vm_name2" {
  value = google_compute_instance.myinstance[1].name
}


output "for_list" {
  value = [for inst in google_compute_instance.myinstance: inst.name]
}


output "for_list_map" {
  value = {for inst in google_compute_instance.myinstance: inst.name =>inst.instance_id}
}

output "for_list_map1" {
  value = {for c,inst in google_compute_instance.myinstance: inst.name =>inst.instance_id}
}

output "for_list_map2" {
  value = {for c,inst in google_compute_instance.myinstance: c =>inst.name}
}


output "legacy_splat" {
  value = google_compute_instance.myinstance.*.name
}

output "latest_splat" {
  value = google_compute_instance.myinstance[*].name
}


/*
output "vm_instanceid" {
  description = "VM Instance ID"
  value = google_compute_instance.myinstance.instance_id
}

output "vm_selflink" {
  description = "VM Instance Self link"
  value = google_compute_instance.myinstance.self_link
}

output "vm_id" {
  description = "VM ID"
  value = google_compute_instance.myinstance.id
}

output "vm_external_ip" {
  description = "VM External IPs"
  value = google_compute_instance.myinstance.network_interface.0.access_config.0.nat_ip
}

## ARGUMENTS
output "vm_name" {
  description = "VM Name"
  value = google_compute_instance.myinstance.name
}

output "vm_machine_type" {
  description = "VM Machine Type"
  value = google_compute_instance.myinstance.machine_type
}

*/