resource "aws_lb_target_group" "public_lb_target_group" {
  name        = "${replace(var.app_name, "_", "-")}-public"
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.vpc.id


  stickiness {
    enabled         = true
    cookie_duration = 180 # 3min
    type            = "lb_cookie"
  }

  health_check {
    path                = var.target_group_health_check_path
    enabled             = true
    healthy_threshold   = var.target_group_healthy_threshold
    interval            = var.target_group_health_check_interval
    timeout             = var.target_group_health_check_timeout
    unhealthy_threshold = var.target_group_unhealthy_threshold
    matcher             = "200"
    port                = "traffic-port"
    protocol            = "HTTP"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "private_lb_target_group" {
  name        = "${replace(var.app_name, "_", "-")}-private"
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.aws_vpc.vpc.id
  health_check {
    path                = var.target_group_health_check_path
    enabled             = true
    healthy_threshold   = var.target_group_healthy_threshold
    interval            = var.target_group_health_check_interval
    timeout             = var.target_group_health_check_timeout
    unhealthy_threshold = var.target_group_unhealthy_threshold
    matcher             = "200"
    port                = "traffic-port"
    protocol            = "HTTP"
  }
  lifecycle {
    create_before_destroy = true
  }
}