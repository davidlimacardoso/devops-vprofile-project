module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = var.vpc_id
  subnet_ids                     = var.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.medium"]

      block_device_mappings = [{
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = 40
          volume_type           = "gp3"
          encrypted             = true
          delete_on_termination = true
        }
      }]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      block_device_mappings = [{
        device_name = "/dev/xvda"
        ebs = {
          volume_size           = 40
          volume_type           = "gp3"
          encrypted             = true
          delete_on_termination = true
        }
      }]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
