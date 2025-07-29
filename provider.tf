terraform {
    required_providers {
        akeyless = {
            source = "akeyless-community/akeyless"
            version = "1.9.0"
        }
    }
}

provider "akeyless" {
    api_gateway_address = "https://api.akeyless.io"

    jwt_login {
        access_id = "p-y5bae7zhmim1om"
        jwt = ""
    }
}