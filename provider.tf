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

module "authentication_and_access" {
    source = "./modules/auth"
}

resource "akeyless_static_secret" "static_secret" {
    path = "/terraform/terraform-test"
    value = "Hello World!"
}

data "akeyless_dynamic_secret" "mysql_dynamic_secret" {
    path = "/4-dynamic-secret/mysql"
}

data "akeyless_dynamic_secret" "k8s_dynamic_secret" {
    path = "/4-dynamic-secret/generic-k8s-ds"
}