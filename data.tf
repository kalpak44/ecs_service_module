data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_lb" "public_lb" {
  count = var.public_load_balancer_name == null ? 0 : 1
  name  = var.public_load_balancer_name
}

data "aws_lb" "private_lb" {
  count = var.private_load_balancer_name == null ? 0 : 1
  name  = var.private_load_balancer_name
}


data "aws_route53_zone" "public_zone" {
  count = var.public_domain == null ? 0 : 1
  name  = var.public_domain
}

data "aws_route53_zone" "private_zone" {
  count        = var.private_domain == null ? 0 : 1
  private_zone = true
  name         = var.private_domain
}

data "aws_lb_listener" "listener_rule_on_public_lb_443" {
  count             = var.public_load_balancer_name == null ? 0 : 1
  load_balancer_arn = data.aws_lb.public_lb[0].arn
  port              = 443
}

data "aws_lb_listener" "listener_rule_on_private_lb_80" {
  count             = var.private_load_balancer_name == null ? 0 : 1
  load_balancer_arn = data.aws_lb.private_lb[0].arn
  port              = 80
}