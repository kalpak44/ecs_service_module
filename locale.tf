locals {
  service_public_url = "${var.subdomain}.${var.public_domain}"
  service_private_url = "${var.subdomain}.${var.private_domain}"
}