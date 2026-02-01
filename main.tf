terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

# Define storage pool
resource "libvirt_pool" "default" {
  name = "default"
  type = "dir"
  # path = "/var/lib/libvirt/images"
}

# Define network with proper configuration
# resource "libvirt_network" "default" {
#   name      = "default"
#   mode      = "nat"
#   addresses = ["10.0.1.0/24"]
#   dhcp {
#     enabled = true
#   }
# }

# Base cloud image (if you have one downloaded)
resource "libvirt_volume" "ubuntu-base" {
  name   = "ubuntu-base"
  pool   = libvirt_pool.default.name
  count = 1
  source = "${path.module}/noble-server-cloudimg-amd64.img"
  format = "qcow2"
}

# Create a volume based on the base image
resource "libvirt_volume" "ubuntu-disk" {
  name          = "ubuntu-disk"
  pool          = libvirt_pool.default.name
  base_volume_id = libvirt_volume.ubuntu-base.id
  size          = 10240 * 1024 * 1024  # 10GB in bytes
  format        = "qcow2"
}

# Cloud-init configuration (necessary for Ubuntu cloud images)
resource "libvirt_cloudinit_disk" "cloudinit" {
  name           = "cloudinit.iso"
  pool           = libvirt_pool.default.name
  user_data      = <<EOF
#cloud-config
hostname: ubuntu-vm
manage_etc_hosts: true
users:
  - name: ubuntu
    ssh-authorized-keys:
      - <your-ssh-public-key-here>
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash
EOF
}

# Create the VM
resource "libvirt_domain" "ubuntu-vm" {
  name   = "ubuntu-vm"
  memory = "2048"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  network_interface {
    network_id = libvirt_network.default.id
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.ubuntu-disk.id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

output "ubuntu_vm_ip" {
  value = libvirt_domain.ubuntu-vm.network_interface[0].addresses[0]
  depends_on = [
    libvirt_domain.ubuntu-vm
  ]
}