terraform {
  required_providers {
    multipass = {
      source = "todoroff/multipass"
    }
  }
  
  # provider "multipass" {
  #   command_timeout = "3m"
  # }
}
provider "multipass" {
  # Increase this to 5 minutes (300 seconds)
  # This gives Hyper-V enough time to bridge the network
  command_timeout = 300
}

resource "multipass_instance" "web_server" {
  name   = "prod-sim-01"
  # ubuntu 24.04 .4 LTS
  image  = "noble"
  cpus   = 2
  memory = "2G"
  networks {
    name = "DevOps-Internal"
  }
  
  # We read your local public key and inject it into the template
  cloud_init = templatefile("${path.module}/cloud-init.tftpl", {
    ssh_public_key = file("~/.ssh/id_multipass.pub")
  })

  lifecycle {
    ignore_changes = [cpus, memory, cloud_init]
  }
  # timeouts {
  #   create = "5m"
  #   delete = "5m"
  # }
}
resource "local_file" "ssh_config" {
  filename        = "${path.module}/ssh_config"
  file_permission = "0600"
  content         = <<-EOT
    Host prod-sim
      HostName ${multipass_instance.web_server.ipv4[0]}
      User ubuntu
      IdentityFile ~/.ssh/id_multipass
      StrictHostKeyChecking no
  EOT
}
# resource "local_file" "ansible_inventory" {
#   content  = <<-EOT
#     [web_servers]
#     prod-sim-01 ansible_host=${multipass_instance.web_server.ipv4[0]} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_multipass ansible_ssh_common_args='-o StrictHostKeyChecking=no'
#   EOT
#   filename = "${path.module}/ansible-inventory/inventory.ini"
# }
output "instance_ip" {
  value = multipass_instance.web_server.ipv4[0]
}