terraform {
  backend "s3" {
    bucket         = var.backend_bucket
    key            = var.backend_key
    region         = var.aws_region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
  }
}
# Configuración del backend de Terraform para almacenar el estado en S3