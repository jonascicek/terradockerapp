terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

provider "docker" {
  # optional: falls du Docker woanders laufen lässt, kannst du auch host angeben
  # host = "unix:///var/run/docker.sock"
}
