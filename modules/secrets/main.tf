
terraform {
    required_providers {
        akeyless = {
            source = "akeyless-community/akeyless"
            version = "1.10.2"
        }
    }
}

resource "akeyless_static_secret" "static_secret" {
    path = "/terraform/terraform-test"
    value = "Hello World!"
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
