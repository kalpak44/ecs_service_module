resource "aws_lb_listener_rule" "public_listener_rule" {
  count        = var.public_load_balancer_name == null ? 0 : 1
  listener_arn = data.aws_lb_listener.listener_rule_on_public_lb_443[0].arn
  priority     = var.load_balancer_rule_priority

  dynamic "action" {
    for_each = var.public_load_balancer_name == null ? [] : [1]
    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.public_lb_target_group[0].arn
    }
  }

  dynamic "condition" {
    for_each = var.public_domain == null ? [] : [1]
    content {
      host_header {
        values = ["${var.subdomain}.${var.public_domain}"]
      }
    }
  }

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_lb_target_group.public_lb_target_group[0]
  ]
}

resource "aws_lb_listener_rule" "private_listener_rule" {
  count        = var.private_load_balancer_name == null ? 0 : 1
  listener_arn = data.aws_lb_listener.listener_rule_on_private_lb_80[0].arn
  priority     = var.load_balancer_rule_priority

  dynamic "action" {
    for_each = var.private_load_balancer_name == null ? [] : [1]
    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.private_lb_target_group[0].arn
    }
  }
  dynamic "condition" {
    for_each = var.private_domain == null ? [] : [1]
    content {
      host_header {
        values = ["${var.subdomain}.${var.private_domain}"]
      }
    }
  }

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_lb_target_group.private_lb_target_group[0]
  ]
}

resource "aws_lb_listener" "private_nb_listener" {
  count             = var.private_network_load_balancer_name == null || var.private_nb_listener_port == null ? 0 : 1
  load_balancer_arn = data.aws_lb.private_nb.arn
  port              = var.private_nb_listener_port
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_nb_target_group[0].arn
  }
}