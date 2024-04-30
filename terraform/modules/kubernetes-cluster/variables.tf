variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "ec2_ssh_key" {
  description = "Name of the EC2 key pair to associate with the instances"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group for the worker nodes"
  type        = string
}