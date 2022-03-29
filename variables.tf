variable "aws_region" {
  type = string
}

variable "app_name" {
  type = string
}

variable "docker_registry" {
  type = string
}

variable "image_tag" {
  type = string
}

variable "public_domain" {
  default = null
}

variable "private_domain" {
  default = null
}

variable "public_load_balancer_name" {
  type        = string
  default     = null
  description = "public app load balancer name"
}

variable "private_load_balancer_name" {
  type        = string
  default     = null
  description = "private app load balancer name"
}

variable "private_network_load_balancer_name" {
  type        = string
  description = "private network app load balancer name"
  default     = null
}
variable "private_nb_listener_port" {
  type    = number
  default = null
}


variable "load_balancer_rule_priority" {
  type    = number
  default = null
}

variable "task_compatibilities" {
  type    = set(string)
  default = ["EC2"]
}

variable "task_environment" {
  type    = set(map(string))
  default = []
}

variable "task_secrets" {
  type    = set(map(string))
  default = []
}

variable "container_port" {
  type = number
}

variable "container_cpu" {
  type    = number
  default = null
}

variable "container_memory" {
  type    = number
  default = null
}

variable "task_execution_role" {
  type        = string
  description = "ARN"
  default     = null
}

variable "service_execution_role" {
  type        = string
  description = "ARN"
  default     = null
}

variable "container_memory_reservation" {
  type    = number
  default = 256
}

variable "cloud_watch_logs_group" {
  type    = string
  default = "/"
}

variable "cluster_name" {
  type    = string
  default = "aws-ecs-cluster"
}

variable "desired_tasks_count" {
  type    = number
  default = 1
}

variable "service_scheduling_strategy" {
  type    = string
  default = "REPLICA"
}

variable "service_deployment_maximum_percent" {
  type    = number
  default = 200
}

variable "service_deployment_minimum_healthy_percent" {
  type    = number
  default = 50
}

variable "service_health_check_grace_period_seconds" {
  type    = number
  default = 0
}

variable "service_enable_ecs_managed_tags" {
  type    = bool
  default = true
}

variable "force_new_deployment" {
  type    = bool
  default = true
}

variable "target_group_health_check_path" {
  type    = string
  default = "/health"
}

variable "target_group_healthy_threshold" {
  type    = number
  default = 3
}

variable "target_group_health_check_interval" {
  type    = number
  default = 30
}

variable "target_group_health_check_timeout" {
  type    = number
  default = 10
}

variable "target_group_unhealthy_threshold" {
  type    = number
  default = 3
}

variable "vpc_name" {
  type = string
}

variable "subdomain" {
  type = string
}
