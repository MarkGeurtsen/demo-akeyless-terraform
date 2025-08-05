terraform {
    required_providers {
        akeyless = {
            source = "akeyless-community/akeyless"
            version = "1.9.0"
        }
    }
}

variable "team_name" {
    type = string
}

resource "akeyless_auth_method_saml" "authentication_method" {
    name = "terraform/${var.team_name}-auth-method"
    unique_identifier = "email"
    idp_metadata_url = "https://${var.team_name}.okta.com/app/exkot5op6eUeTvji15d7/sso/saml/metadata"
}

resource "akeyless_role" "access_role" {
    depends_on = [ akeyless_auth_method_saml.authentication_method ]
    name = "terraform/${var.team_name}-access-role"

    assoc_auth_method {
        am_name = "terraform/auth-method"
        sub_claims = {
            groups = "developers"
        }
    }

    rules {
        capability = ["read", "list"]
        path = "/*"
        rule_type = "item-rule"
    }
}