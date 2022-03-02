resource "aws_route53_record" "public" {
  count   = var.public_load_balancer_name == null ? 0 : 1
  zone_id = data.aws_route53_zone.public_zone.id
  name    = local.service_public_url
  type    = "A"
  alias {
    name                   = data.aws_lb.public_lb[0].dns_name
    zone_id                = data.aws_lb.public_lb[0].zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "private" {
  count   = var.private_load_balancer_name == null ? 0 : 1
  zone_id = data.aws_route53_zone.private_zone.id
  name    = local.service_private_url
  type    = "A"
  alias {
    name                   = data.aws_lb.private_lb[0].dns_name
    zone_id                = data.aws_lb.private_lb[0].zone_id
    evaluate_target_health = true
  }
}
