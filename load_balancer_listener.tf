resource "aws_lb_listener_rule" "public_listener_rule" {
  listener_arn = data.aws_lb_listener.listener_rule_on_public_lb_443.arn
  priority     = var.load_rule_priority
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }

  condition {
    host_header {
      values = [local.service_public_url]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_lb_target_group.target_group
  ]
}

resource "aws_lb_listener_rule" "private_listener_rule" {
  listener_arn = data.aws_lb_listener.listener_rule_on_private_lb_80.arn
  priority     = var.load_rule_priority
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }

  condition {
    host_header {
      values = [local.service_private_url]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_lb_target_group.target_group
  ]
}