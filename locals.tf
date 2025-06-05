locals {
  nginx_container_name = "nginx_${var.network_name}"
  app_container_name   = "app_${var.network_name}"
  volume_name          = var.enable_volume ? "app_data_${var.network_name}" : ""
}
