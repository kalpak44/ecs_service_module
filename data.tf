data "aws_lb" "public_lb" {
  name = var.public_load_balancer_name
}

data "aws_lb" "private_lb" {
  name = var.public_load_balancer_name
}


data "aws_route53_zone" "public_zone" {
  name = var.public_domain
}

data "aws_route53_zone" "private_zone" {
  private_zone = true
  name         = var.private_domain
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_lb_listener" "listener_rule_on_public_lb_443" {
  load_balancer_arn = data.aws_lb.public_lb.arn
  port              = 443
}

data "aws_lb_listener" "listener_rule_on_private_lb_80" {
  load_balancer_arn = data.aws_lb.private_lb.arn
  port              = 80
}