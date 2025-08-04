terraform {
    required_providers {
        akeyless = {
            source = "akeyless-community/akeyless"
            version = "1.9.0"
        }
    }
}

resource "akeyless_auth_method_saml" "authentication_method" {
    name = "terraform/auth-method"
    unique_identifier = "email"
    idp_metadata_url = "https://dev-18478873.okta.com/app/exkot5op6eUeTvji15d7/sso/saml/metadata"
}

resource "akeyless_role" "access_role" {
    depends_on = [ akeyless_auth_method_saml.authentication_method ]
    name = "terraform/access-role"

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