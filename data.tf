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