locals {
  service_public_url = "${var.subdomain}.${var.public_domain[0]}"
  service_private_url = "${var.subdomain}.${var.private_domain[0]}"
}