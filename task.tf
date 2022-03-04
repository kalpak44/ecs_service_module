resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.app_name
  requires_compatibilities = var.task_compatibilities
  execution_role_arn       = var.task_execution_role
  task_role_arn            = var.task_execution_role
  container_definitions    = jsonencode([
    {
      name              = var.app_name
      image             = "${var.docker_registry}/${var.app_name}:${var.image_tag}"
      cpu               = var.container_cpu
      memory            = var.container_memory
      memoryReservation = var.container_memory_reservation
      linuxParameters   = {
        initProcessEnabled = true
      }
      enableExecuteCommand = true
      essential            = true
      logConfiguration : {
        logDriver : "awslogs"
        options : {
          awslogs-group : var.cloud_watch_logs_group
          awslogs-region : var.aws_region
          awslogs-stream-prefix : "${var.app_name}_${var.image_tag}"
        }
      }

      environment  = var.task_environment
      secrets      = var.task_secrets
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = 0
          protocol      = "tcp"
        }
      ]
    }
  ])
}