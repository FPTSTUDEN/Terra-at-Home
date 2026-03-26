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
  command_timeout = 420
}

resource "multipass_instance" "prod-sim" {
  name   = "prod-sim-01"
  # ubuntu 24.04 .4 LTS
  image = "file://${path.module}/FileServerData/noble-server-cloudimg-amd64.img"
  cpus   = 2
  memory = "3G"
  disk = "15G"
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
resource "null_resource" "attach_vhdx" {
  depends_on = [multipass_instance.prod-sim]

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]
    command     = <<EOT
      $projectDir = Get-Location
      $vhdPath = "$projectDir\FileServerData\persistent-storage.vhdx"
      
      $script = "Add-VMHardDiskDrive -VMName ${multipass_instance.prod-sim.name} -Path '$vhdPath' -ControllerType SCSI"
      
      Start-Process powershell -Verb RunAs -Wait -ArgumentList "-NoProfile", "-Command", $script
    EOT
  }
}
resource "local_file" "ssh_config" {
  filename        = "${path.module}/ssh_config"
  file_permission = "0600"
  content         = <<-EOT
    Host prod-sim
      HostName ${multipass_instance.prod-sim.ipv4[0]}
      User ubuntu
      IdentityFile ~/.ssh/id_multipass
      StrictHostKeyChecking no
  EOT
}
# resource "local_file" "ansible_inventory" {
#   content  = <<-EOT
#     [prod-sims]
#     prod-sim-01 ansible_host=${multipass_instance.prod-sim.ipv4[0]} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_multipass ansible_ssh_common_args='-o StrictHostKeyChecking=no'
#   EOT
#   filename = "${path.module}/ansible-inventory/inventory.ini"
# }
output "instance_ip" {
  value = multipass_instance.prod-sim.ipv4[0]
}