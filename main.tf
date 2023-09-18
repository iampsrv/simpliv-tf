provider "aws" {
  region = "us-east-1"
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-pranjal"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# output "instance_ip_addr" {
#   value = aws_instance.web.private_ip
# }

terraform {
  cloud {
    organization = "simpliv"

    workspaces {
      name = "ps-wp"
    }
  }
}