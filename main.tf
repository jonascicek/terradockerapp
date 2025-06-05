resource "docker_network" "app_network" {
  name = var.network_name
}

module "app_container" {
  source            = "./modules/containerized_service"
  name              = local.app_container_name
  image             = var.app_image
  network_name      = docker_network.app_network.name  # Changed from network_id
  attach_volume     = var.enable_volume
  volume_name       = local.volume_name
  internal_port     = 80
  external_port     = 8081
  providers = {
    docker = docker
  }
}

module "nginx_container" {
  source            = "./modules/containerized_service"
  name              = local.nginx_container_name
  image             = var.nginx_image
  network_name      = docker_network.app_network.name  # Changed from network_id
  attach_volume     = false
  volume_name       = "jigglyy"
  internal_port     = 80
  external_port     = var.expose_ports[0]
  depends_on        = [module.app_container]
  providers = {
    docker = docker
  }
}
