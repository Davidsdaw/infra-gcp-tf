variable "aws_region" {
    type        = string
    description = "AWS region"
    default     = "eu-west-3"
}

##############################
# Backend variables
##############################
variable "environment" {
    type        = string
    description = "Environment name"
    default     = "dev"
}

variable "backend_bucket" {
    type        = string
    description = "S3 bucket for Terraform state"
    default     = "tf-state-davidsdaw"
}
variable "dynamodb_table" {
    type        = string
    description = "DynamoDB table for Terraform state locking"
    default     = "terraform-locks"
}
variable "backend_key" {
    type        = string
    description = "S3 key for Terraform state"
    default     = "global/s3/terraform.tfstate"
}

##############################
# Tags variables
##############################
variable "owner" {
    type        = string
    description = "Owner of the resources"
    default     = "Dsanchez"
}
variable "project" {
    type        = string
    description = "Project name"
    default     = "TF-Profile"
}
variable "environment_tag" {
    type        = string
    description = "Environment tag for resources"
    default     = "Dev"
}
variable "expiry_date" {
    type        = string
    description = "Expiry date for the resources"
    default     = "2026-11-07"
}
variable "managed_by" {
    type        = string
    description = "Managed by tag for resources"
    default     = "terraform"
}

##############################
# VPC variables 
##############################
variable "vpc_cidr" {
    type        = string
    description = "CIDR block for the VPC"
    default     = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
    type        = list(string)
    description = "List of CIDR blocks for public subnets"
    default     = ["10.0.1.0/24"]
}
variable "private_subnet_cidrs" {
    type        = list(string)
    description = "List of CIDR blocks for private subnets"
    default     = []
}
variable "availability_zones" {
    type        = list(string)
    description = "List of availability zones"
    default     = [var.aws_region + "a"]
}
##############################
# ECR variables
##############################
variable "ecr_repository_name" {
    type        = string
    description = "Name of the ECR repository"
    default     = "DevOps-Project"
}
variable "ecr_image_tag_mutability" {
    type        = string
    description = "Image tag mutability setting for the ECR repository"
    default     = "MUTABLE"
}
variable "ecr_scan_on_push" {
    type        = bool
    description = "Enable image scanning on push for the ECR repository"
    default     = true
}
###############################
# EC2 variables
###############################
variable "ec2_name" {
    type        = string
    description = "Name tag for the EC2 instance"
    default     = "EC2-Main"
}
variable "ec2_instance_type" {
    type        = string
    description = "Type of EC2 instance"
    default     = "t3.micro"
}
variable "ec2_ami" {
    type        = string
    description = "AMI ID for the EC2 instance"
    default     = "ami-0c02fb55956c7d316"
}
variable "ec2_key_name" {
    type        = string
    description = "Key pair name for the EC2 instance"
    default     = "keypair1"
}
variable "ec2_subnet_id" {
    type        = string
    description = "Subnet ID for the EC2 instance"
    default     = module.vpc.public_subnet_cidrs[0]
}
variable "ec2_root_volume_size" {
    type        = number
    description = "Root volume size for the EC2 instance"
    default     = 20
}
variable "ec2_root_volume_type" {
    type        = string
    description = "Root volume type for the EC2 instance"
    default     = "gp2"
}
variable "ec2_monitoring" {
    type        = bool
    description = "Enable detailed monitoring for the EC2 instance"
    default     = false
}