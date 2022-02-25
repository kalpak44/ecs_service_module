resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.zone.id
  name    = local.service_url
  type    = "A"
  alias {
    name                   = data.aws_lb.lb.dns_name
    zone_id                = data.aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}
