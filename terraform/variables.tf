# variables.tf

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the worker nodes"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "kubernetes_version" {
  description = "Version of Kubernetes"
  type        = string
}
