
terraform {
    required_providers {
        akeyless = {
            source = "akeyless-community/akeyless"
            version = "1.9.0"
        }
    }
}

resource "akeyless_static_secret" "static_secret" {
    path = "/terraform/terraform-test"
    value = "Hello World!"
}

# data "akeyless_static_secret" "github_private_key" {
#     path = "/1-static-secret/github_private_key"
# }

import {
    id = "/1-static-secret/github_private_key"
    to = akeyless_static_secret.github_private_key
}

resource "akeyless_static_secret" "github_private_key" {
    name = "/1-static-secret/github_private_key"
}

resource "akeyless_target_github" "github_target" {
    depends_on = [ data.akeyless_static_secret.github_private_key ]
    name = "/terraform/github"
    github_app_id = 1284667
    github_app_private_key = data.akeyless_static_secret.github_private_key.value
}

data "akeyless_static_secret" "get_static_secret" {
    path = "/1-static-secret/MyFirstSecret"
}

data "akeyless_dynamic_secret" "mysql_dynamic_secret" {
    path = "/4-dynamic-secret/mysql"
}

data "akeyless_dynamic_secret" "k8s_dynamic_secret" {
    path = "/4-dynamic-secret/generic-k8s-ds"
}