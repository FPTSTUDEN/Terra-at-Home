terraform {
  required_providers {
    multipass = {
      source = "todoroff/multipass"
    }
  }
}

resource "multipass_instance" "web_server" {
  name   = "prod-sim-01"
  cpus   = 2
  memory = "2G"
  
  # This is the "Enterprise Secret Sauce"
  cloud_init = <<-EOT
    #cloud-config
    packages:
      - docker.io
    runcmd:
      - systemctl enable --now docker
      - usermod -aG docker ubuntu
  EOT
}