resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "/bin/bash ${path.module}/../ansible/runansible.sh"
  }
  depends_on = [
    module.rgroup_N01570815,
    module.datadisk_N01570815,
    module.vmlinux_N01570815
  ]
}
