variable "name" {
  default = "vm"
}

resource "digitalocean_droplet" "vm" {
  name      = "${var.name}"
  image     = "ubuntu-16-04-x64"
  region    = "fra1"
  size      = "512mb"
  ipv6      = true
  user_data = "${data.template_file.cloudinit.rendered}"
}

resource "dnsimple_record" "vm_a" {
  domain = "w9f.de"
  name   = "${var.name}"
  value  = "${digitalocean_droplet.vm.ipv4_address}"
  type   = "A"
  ttl    = 60
}

resource "dnsimple_record" "vm_aaaa" {
  domain = "w9f.de"
  name   = "${var.name}"
  value  = "${digitalocean_droplet.vm.ipv6_address}"
  type   = "AAAA"
  ttl    = 60
}

data "template_file" "cloudinit" {
  template = "${file("../cloudinit/service_http.yaml")}"

  vars {
    hostname = "${var.name}"
  }
}
