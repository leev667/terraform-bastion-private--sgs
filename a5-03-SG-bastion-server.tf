# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "public_bastion_sub_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = "public-bastion-sub-sg"
  description = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["185.92.122.211/32"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags
}
