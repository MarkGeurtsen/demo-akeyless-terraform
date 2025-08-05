resource "akeyless_target_github" "github_target" {
    depends_on = [ data.akeyless_static_secret.github_private_key ]
    
    name = "/terraform/github"
    github_app_id = 1284667
    github_app_private_key = data.akeyless_static_secret.github_private_key.value
}

data "akeyless_static_secret" "github_private_key" {
    path = "/1-static-secret/github_private_key"
}