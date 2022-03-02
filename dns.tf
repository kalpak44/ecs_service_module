resource "aws_route53_record" "public" {
  zone_id = data.aws_route53_zone.public_zone.id
  name    = local.service_public_url
  type    = "A"
  alias {
    name                   = data.aws_lb.public_lb.dns_name
    zone_id                = data.aws_lb.public_lb.zone_id
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "private" {
  zone_id = data.aws_route53_zone.private_zone.id
  name    = local.service_private_url
  type    = "A"
  alias {
    name                   = data.aws_lb.private_lb.dns_name
    zone_id                = data.aws_lb.private_lb.zone_id
    evaluate_target_health = true
  }
}
