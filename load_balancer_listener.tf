resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = data.aws_lb_listener.listener_rule_on_443.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service_tg.arn
  }

  condition {
    host_header {
      values = [local.service_url]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_lb_target_group.service_tg
  ]
}