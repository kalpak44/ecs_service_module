data "aws_lb" "lb" {
  name = var.application_load_balancer_name
}

data "aws_route53_zone" "zone" {
  name = var.domain
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_lb_listener" "listener_rule_on_443" {
  load_balancer_arn = data.aws_lb.lb.arn
  port              = 443
}