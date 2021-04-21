```terraform
variable "hosts" {
  default   = {
    "10.13.237.16" = "localhost hithub.local"
    "10.13.237.17" = "localhost hithub.local"
    "10.13.237.18" = "localhost hithub.local"
  }
 }
resource "null_resource" "hosts" {
 for_each = var.hosts
 provisioner "local-exec" {
  command = "echo '${each.key} ${each.value}'>> hosts.txt"
 }
}

```
