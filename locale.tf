locals {
  service_url = "${var.env}-${replace(var.app_name, "_", "-")}.${var.domain}"
}