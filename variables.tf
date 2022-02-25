variable "aws_access_key_id" {
  type    = string
}
variable "aws_secret_access_key" {
  type    = string
}
variable "aws_region" {
  type    = string
}
variable "app_name" {
  type    = string
}
variable "docker_registry" {
  type = string
}
variable "image_tag" {
  type = string
}
variable "domain" {
  default = "example.com"
}
variable "application_load_balancer_name" {
  default = "aws-public-application-load-balancer"
}
variable "task_compatibilities" {
  default = ["EC2"]
}
variable "task_environment" {
  default = []
}
variable "task_secrets" {
  default = []
}
variable "container_port" {
}
variable "container_cpu" {
  default = null
}
variable "container_memory" {
  default = null
}
variable "task_execution_role" {
  default = null
}
variable "service_execution_role" {
  default = null
}
variable "container_memory_reservation" {
  default = 256
}
variable "cloud_watch_logs_group" {
  default = "/"
}
variable "cluster_name" {
  default = "aws-ecs-cluster"
}
variable "desired_tasks_count" {
  default = 2
}
variable "service_scheduling_strategy" {
  default = "REPLICA"
}
variable "service_deployment_maximum_percent" {
  default = 200
}
variable "service_deployment_minimum_healthy_percent" {
  default = 50
}
variable "service_health_check_grace_period_seconds" {
  default = 0
}
variable "service_enable_ecs_managed_tags" {
  default = true
}
variable "force_new_deployment" {
  default = true
}
variable "target_group_health_check_path" {
  default = "/health"
}
variable "target_group_healthy_threshold" {
  default = 3
}
variable "target_group_health_check_interval" {
  default = 10
}
variable "target_group_health_check_timeout" {
  default = 5
}
variable "target_group_unhealthy_threshold" {
  default = 3
}

