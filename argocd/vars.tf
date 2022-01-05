
variable "argo_cd_version" {
  description = "The version of Argo CD."
  type        = string
  default     = "1.8.7"
}


variable "cluster_name" {
  description = "Eks cluster name"
  type = string
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-west-1"
  type        = string
}