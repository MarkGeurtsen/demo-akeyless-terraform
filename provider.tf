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

resource "akeyless_static_secret" "static_secret" {
    path = "/terraform/terraform-test"
    value = "Hello World!"
}