locals {
  usernames = [for i in jsondecode(file("${path.module}/files/usernames.json")) : i]
}