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

resource "akeyless_auth_method_oauth2" "oauth2-auth" {
  name              = "terraform/oauth-2-auth-method"
  unique_identifier = "repository"

  gateway_url = "https://aws-gw.mg-aws.cs.akeyless.fans"
  jwks_uri    = "https://token.actions.githubusercontent.com/.well-known/jwks"
  jwt_ttl     = 180 # minutes

}
