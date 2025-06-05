variable "network_name" {
  description = "Name of the Docker network"
  type        = string
  default     = "appnet"
}

variable "nginx_image" {
  description = "Docker image for nginx"
  type        = string
  default     = "nginx:latest"
}

variable "app_image" {
  description = "Docker image for the app"
  type        = string
  default     = "kennethreitz/httpbin"
}

variable "expose_ports" {
  description = "Ports to expose from the nginx container"
  type        = list(number)
  default     = [8082]
}

variable "enable_volume" {
  description = "Whether to use a named volume for app data"
  type        = bool
  default     = true
}
