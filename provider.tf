terraform {
    required_providers {
        akeyless = {
            source = "akeyless-community/akeyless"
            version = "1.9.0"
        }
    }

    backend "s3" {
        bucket = "markg-terraform-bucket"
        key = "project/terraform.tfstate"
        region = "us-east-2"
        encrypt = true
    }
}

variable "jwt" {
    type = string
}

provider "akeyless" {
    api_gateway_address = "https://api.akeyless.io"

    jwt_login {
        access_id = "p-y5bae7zhmim1om"
        jwt = var.jwt
    }
}

# import {
#     id = "/1-static-secret/github-app-private-key"
#     to = module.secrets.akeyless_static_secret.github_private_key
# }

module "authentication_and_access" {
    source = "./modules/auth"
}

module "secrets" {
    source = "./modules/secrets"
}

