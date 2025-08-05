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

module "secrets" {
    source = "./modules/secrets"
}

# Auth method and access role created for each time.

variable "team_names" {
    type = list(string)
}

module "authentication_and_access" {
    count = length(var.team_names)
    source = "./modules/auth"

    team_name = var.team_names[count.index]
}
