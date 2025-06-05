output "container_id" {
  value = docker_container.service.id
}

output "container_name" {
  value = docker_container.service.name
}

output "container_ip" {
  value       = docker_container.service.network_data[0].ip_address
  description = "The IP address of the container"
}

output "container_network" {
  value       = docker_container.service.network_data[0].network_name
  description = "The network name the container is connected to"
}
