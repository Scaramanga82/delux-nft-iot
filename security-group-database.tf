module "db_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.5.0"

  name        = "db-sg-${var.env}"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port       = 5432
      to_port         = 5432
      protocol        = "tcp"
      source_security_group_id = module.web_sg.security_group_id
      description     = "Allow Postgres from web servers"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}
