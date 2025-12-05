module "db_secret" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "1.7.0"

  name        = "aurora-${var.env}-credentials"
  description = "Credentials for Aurora PostgreSQL"

  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    engine   = "aurora-postgresql"
    dbname   = var.db_name
    host     = module.aurora_pg.cluster_endpoint
    port     = 5432
  })

  kms_key_id = var.kms_key_id

  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}
