locals {
  service_url = "${replace(var.app_name, "_", "-")}.${var.domain}"
}