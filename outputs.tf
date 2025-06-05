output "nginx_container_id" {
  value = module.nginx_container.container_id
}

output "nginx_container_ip" {
  value = module.nginx_container.container_ip
}

output "app_container_id" {
  value = module.app_container.container_id
}

output "app_container_ip" {
  value = module.app_container.container_ip
}
