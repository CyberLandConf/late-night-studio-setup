variable "hcloud_token" {}
variable "ssh_key" {}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create a server
resource "hcloud_server" "late-night-studio" {
  name = "late-night-studio-instance"
  image = "ubuntu-20.04"
  server_type = "cx11"
  location = "nbg1"
  ssh_keys = [
    "late-night-key"
  ]

  provisioner "remote-exec" {
   inline = [
     "while fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do sleep 1; done",
     "apt-get -qq update -y",
     "apt-get -qq install python -y",
   ]
   connection {
     type        = "ssh"
     user        = "root"
     private_key = file(var.ssh_key)
     host = hcloud_server.late-night-studio.ipv4_address
   }
  }

  provisioner "local-exec" {
    command = "ssh-keygen -R ${hcloud_server.late-night-studio.ipv4_address}; ssh-keyscan -H ${hcloud_server.late-night-studio.ipv4_address} >> ~/.ssh/known_hosts"
  }
}

output "public_ip_address" {
  value = hcloud_server.late-night-studio.ipv4_address
}
