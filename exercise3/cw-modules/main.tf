provider "aws" {
  region = "us-east-1"
}

module "docker-instance" {
  source                = "AydinTokuslu/docker-instance/aws"
  key_name              = "first_key"
  docker-instance-ports = [22, 80, 8080]
  num_of_instance       = 2
}

output "pub_ip" {
  value = module.docker-instance.instance_public_ip.*
}

