variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "eks-multi-tier-project"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
variable "prefix" {
  description = "Prefix to be used for all resources"
  type        = string
  default     = "bootcamp"
}

variable "db_default_settings" {
  type = any
  default = {
    allocated_storage       = 30
    max_allocated_storage   = 50
    engine_version          = 14.15
    instance_class          = "db.t3.micro"
    backup_retention_period = 2
    db_name                 = "postgres"
    ca_cert_name            = "rds-ca-rsa2048-g1"
    db_admin_username       = "postgres"
  }
}

#Variables for OIDC module
variable "role_name" {
  description = "Name of the IAM role for GitHub Actions"
  type        = string
  default     = "GitHubActionsRole"
}

variable "policy_name" {
  description = "Name of the IAM policy for GitHub Actions"
  type        = string
  default     = "GitHubActionsPolicy"
}

variable "github_repositories" {
  description = "List of GitHub repositories to grant access to"
  type = list(object({
    org    = string
    repo   = string
    branch = string
  }))
  default = [
    {
      org    = "iamDayoDev"
      repo   = "eks-multi-tier-terraform-project"
      branch = "*"
    }
  ]
}

variable "policy_json" {
  description = "JSON policy document to attach to the IAM role"
  type        = string
  default = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
