terraform {
  backend "s3" {
    bucket         = "tf-state-davidsdaw"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
# Configuración del backend de Terraform para almacenar el estado en S3