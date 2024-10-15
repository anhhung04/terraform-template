data "http" "github_keys" {
  count = length(var.github_usernames)
  url   = "https://github.com/${var.github_usernames[count.index]}.keys"
}
