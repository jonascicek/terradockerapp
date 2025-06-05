terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_container" "service" {
  name  = var.name
  image = var.image

  networks_advanced {
    name = var.network_name  # Changed from network_id
  }

  dynamic "volumes" {
    for_each = var.attach_volume && var.volume_name != "" ? [1] : []
    content {
      volume_name    = var.volume_name
      container_path = "/data"
    }
  }

  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
