variable "name"          { type = string }
variable "image"         { type = string }
variable "network_name"  { type = string }  # Changed from network_id
variable "attach_volume" { type = bool }
variable "volume_name"   { type = string }
variable "internal_port" { type = number }
variable "external_port" { type = number }
