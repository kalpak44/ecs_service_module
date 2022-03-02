resource "aws_route53_record" "public" {
  count   = var.public_load_balancer_name == null && var.subdomain == null && var.public_domain == null ? 0 : 1
  zone_id = data.aws_route53_zone.public_zone[0].id
  name    = "${var.subdomain}.${var.public_domain}"
  type    = "A"
  dynamic "alias" {
    for_each = var.public_load_balancer_name == null ? [] : [1]
    content {
      name                   = data.aws_lb.public_lb[0].dns_name
      zone_id                = data.aws_lb.public_lb[0].zone_id
      evaluate_target_health = true
    }
  }
}
resource "aws_route53_record" "private" {
  count   = var.private_load_balancer_name == null && var.subdomain == null && var.private_domain == null ? 0 : 1
  zone_id = data.aws_route53_zone.private_zone[0].id
  name    = "${var.subdomain}.${var.private_domain}"
  type    = "A"
  dynamic "alias" {
    for_each = var.private_load_balancer_name == null ? [] : [1]
    content {
      name                   = data.aws_lb.private_lb[0].dns_name
      zone_id                = data.aws_lb.private_lb[0].zone_id
      evaluate_target_health = true
    }
  }
}
