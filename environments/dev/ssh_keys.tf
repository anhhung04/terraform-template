# resource "vultr_ssh_key" "my_ssh_key" {
#   name    = "my-ssh-key"
#   ssh_key = file("${path.module}/path/to/your/public_key.pub")
# }

data "vultr_ssh_key" "exist_key" {
  filter {
    name   = "name"
    values = ["id_ed25519.pub"]
  }
}

# output "new_ssh_key_id" {
#   value = vultr_ssh_key.my_ssh_key.id
# }

output "existing_ssh_key_id" {
  value = data.vultr_ssh_key.exist_key.id
}
