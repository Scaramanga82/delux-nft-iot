module "aurora_pg" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "9.5.0"

  name                 = "aurora-${var.env}"
  engine               = "aurora-postgresql"
  engine_version       = "15.3"
  engine_mode          = "provisioned"
  database_name        = var.db_name
  master_username      = var.db_username
  master_password      = var.db_password
  vpc_id               = var.vpc_id
  subnets              = var.private_subnets
  vpc_security_group_ids = [module.db_sg.security_group_id]

  instance_type        = "db.r6g.large"
  instances            = 2
  publicly_accessible  = false
  apply_immediately    = true
  skip_final_snapshot  = false

  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  preferred_maintenance_window = "sun:23:00-mon:01:00"

  storage_encrypted    = true
  kms_key_id           = var.kms_key_id

  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}
