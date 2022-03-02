resource "aws_ecs_service" "service" {
  name                = var.app_name
  task_definition     = "${aws_ecs_task_definition.task_definition.family}:${aws_ecs_task_definition.task_definition.revision}"
  cluster             = var.cluster_name
  scheduling_strategy = var.service_scheduling_strategy

  iam_role      = var.service_execution_role
  desired_count = var.desired_tasks_count

  deployment_maximum_percent         = var.service_deployment_maximum_percent
  deployment_minimum_healthy_percent = var.service_deployment_minimum_healthy_percent
  health_check_grace_period_seconds  = var.service_health_check_grace_period_seconds
  enable_ecs_managed_tags            = var.service_enable_ecs_managed_tags
  force_new_deployment               = var.force_new_deployment

  # https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html
  placement_constraints {
    type       = "memberOf"
    #todo: make me generic
    expression = "attribute:ecs.availability-zone in [${var.aws_region}a, ${var.aws_region}b]"
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  load_balancer {
    count            = var.public_load_balancer_name == null ? 0 : 1
    target_group_arn = aws_lb_target_group.public_lb_target_group.arn
    container_name   = var.app_name
    container_port   = var.container_port
  }

  load_balancer {
    count            = var.private_load_balancer_name == null ? 0 : 1
    target_group_arn = aws_lb_target_group.private_lb_target_group.arn
    container_name   = var.app_name
    container_port   = var.container_port
  }


  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_lb_listener_rule.public_listener_rule, aws_lb_listener_rule.private_listener_rule,
    aws_ecs_task_definition.task_definition
  ]
}