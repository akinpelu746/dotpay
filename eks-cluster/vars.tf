
variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}