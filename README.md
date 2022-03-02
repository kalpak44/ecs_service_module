# ECS deployment helper

Example:

```terraform
variable "aws_region" {
  type = string
}
variable "docker_registry" {
  type = string
}
variable "image_tag" {
  type = string
}
variable "app_name" {
  type = string
}
provider "aws" {
  region = var.aws_region
}

module "ecs_deployment" {
  source = "github.com/kalpak44/ecs_service_module"

  private_domain                 = "local"
  public_domain                  = "example.com"
  subdomain                      = "api.dev"
  public_load_balancer_name      = "public-load-balancer"
  private_load_balancer_name     = "private-load-balancer"
  cluster_name                   = "ecs-cluster"
  vpc_name                       = "my-vpc"
  target_group_health_check_path = "/health"
  load_rule_priority             = 100
  aws_region                     = var.aws_region
  docker_registry                = var.docker_registry
  app_name                       = var.app_name
  image_tag                      = var.image_tag
  container_port                 = 8080
  task_execution_role            = "arn:aws:iam::***:role/TaskECSRole"
  cloud_watch_logs_group         = "/cluster/ecs-cluster"
}
```