
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



resource "akeyless_static_secret" "github_private_key" {
    path = "/1-static-secret/github-app-private-key"
    value = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBdE8vdE9WbWJxT1ZocDRiZmdoLzNBMkU5dDB0Y2ZLQVM4VE9ibVV0VlF5WG9QcXRJCk1pMDB4YUNCK2xYNXJCYWwrMWxWQm1GbXNHWmErajRabnZGMnB0YTBtTUxOSDlDUU9KTnhyQnBVZDhrQnNCZEMKT2ZBU3hlVlRGcFJZMk8vRk1BUmFyUkNSeExxYitMRjhHbGRjei8xZmQ1dkFRWEVjQ2ZYN0E1L0w3eWxOVThSVwpTREpIN3lOdjhOZkhjNGRSWU4zemdWc3ZhTS9BQ1hJTG95V2JpZHA2SWhZZ2puKzlLYlI0NWtCeXZkQ05QSStkCmRTZmxuZythMUgvdGl6anZ5dEFmT1Nid0ZiUXZGRHFINXFWRzNrVWp6UzFRSVpGWldrUmppM3lBemZBc2xpaWIKUUpRUWZuakdDREF3LzFPOEMyYWt6a1F1VWJGRkR1dFNIN2g0endJREFRQUJBb0lCQUV0VkVYbXRPMGZvcU8zdApFNlhEMVQ1TkFEc09YMlZyNkRjUWU1b3BhVWhad2daRm5mdDJJdUNkWVVCdkIxS0U0M3B3eVJ1czllby8wMlVZCjhlWGhOcnRqN1RFaytlNWpFWWpjcXBrekpUUHlOb2V3UjF5RC9lenkrOU1NMUtrTnV4V3cybWZ2M0NFQ2FPbjAKUzIxVUxrcFNmYXI0NStUWFNRdEVwTXZ2ZmlNR1pZOUMvTEhSaFM0MFRuN1JjUkg3WmZDSHd0bWNZbW0xWXFxUwpxV2o0OUQrRUo1VWd3OWRCd2p0dk1xQm1veUJ4aTZyZDByUmJaUnlyNFBJTnl0cThseEhyYk9ZL09FL3Jjc3htClhST2h6VCtDR2VJSkVEZ3hwR20wenhNTnVuZTZ4am1LeUV3LzRrMEh4SkM3di85ZU1yb2RmRWNsUCtZdXZ4bVoKV1NHaUNZRUNnWUVBNW5TYUI2U1JXUGIvYU9waExxYVlmK25RZ1F3bk1ldUtWbkJ6c3pYc2lybGIySjV3MnB1OAowMmhCeC83NFVjRERNRm1lajFnRjhjOU9nRkVpVFZBUTlPSGp0RUxaMVg5VzBCK3dvYnRPdE1KWWN2L3NOMjVrCmlXeGxKbFJMdTF0NzFCaE1kTlVhc1VzdEsyUHNMMC9FZ1Y3aE93dkJRQ2xBeisxYWhwR1RhSzhDZ1lFQXlQNHkKTlJNa2JISzJtMWlBUGlNbVpnV2JZcVUvSXNxczVMOWFseVBaK2R5RXkwVjFNTFQrVG4xTlFZRVBzTW1FOXY0MQo5aGdMN1oxbEtaNTBUYVVWMWtJeTdRNnhpeHNIcGprY1pXak5LOGFOdGtMSXkvcmtvN0Iyenh2SmlQNXhTWnZSCkl4SHl5alE3bnVwS2FzWUpnNzBnSHNwNHpuMUVKS3EvR1N4dHVlRUNnWUVBcjJ1R2E5YnJCSXRQTTY5bE5qdDkKemJCUEZFd0o4Y2ZYVDZEZGtVYTB2WXdHeThjZkpHaHp2WUNZd2dIbFIyV3hyallwcWZkWTN3M3NOV1NNOWNqQwpmNFVLN1FZT0JxT2RrMkxyOHRBL1F2ekVreFVYMjhIZUtYVW5NWnZzNGJycmNURGwwZkQ5Rm9PZzZHeHhOanBECjNDNDZ4OVZVenVBWUE2NHF3RkJEb3VVQ2dZQVBQSFhCNERtYW52ZUl2eVM1a1NDUUMwekVKWktycUlHQ3RaN0EKWms5WHlZZW5nUlJwSk05Q1UrMVBVZUZHbllBZTJSWnVHVlNPSnFoTWgxNTVwRklMYytrNFh5ekdScjVGczM2YgprVjQ4TzBqeTBBMDRxVVE3eEZ5OVJuWDRsSkV4NjBYblNxMEU5d0N1QTBTdzQySkZRa2oxREpRcjB3TWZaSElvCkRsNGpBUUtCZ1FERmhucmNLcUJXbnJQM3VvTi9sbUdIZHVxOExqWlhzVUlxS2dFbzcwdDNJVnA2OVJHYmVaWVMKMjd2Yk5QVERyeHVRQ0VNRjUwTFordGMzWVpNTmhpWGdyK1FRN3JhSUNVSG8zdHd6aENvUHdpWGQrLzJNZlZuQQptSGVMOEZxWSs0Yi9hTDhiWEpsTERaOHFYay8zVTFMWmkvNCtadkVxTTk3Q3g0azhJTkFQT0E9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQ=="
}

resource "akeyless_target_github" "github_target" {
    #depends_on = [ data.akeyless_static_secret.github_private_key ]

    depends_on = [akeyless_static_secret.github_private_key]

    name = "/terraform/github"
    github_app_id = 1284667
    #github_app_private_key = data.akeyless_static_secret.github_private_key.value

    github_app_private_key = akeyless_static_secret.github_private_key.value
    
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