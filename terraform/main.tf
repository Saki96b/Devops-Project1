# main.tf

provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform/aws/eks/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

module "kubernetes_cluster" {
  source = "./modules/kubernetes_cluster"

  cluster_name        = "my-cluster"
  instance_type       = "t2.medium"
  desired_capacity    = 3
  min_size            = 1
  max_size            = 5
  kubernetes_version  = "1.21"
}

output "kubeconfig" {
  value = module.kubernetes_cluster.kubeconfig
}
