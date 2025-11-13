# Outputs from VPC module
output "vpc_id" {
    description = "ID of the VPC"
    value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
    description = "IDs of public subnets"
    value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
    description = "IDs of private subnets"
    value       = module.vpc.private_subnet_ids
}

# Outputs from Security Group module
output "security_group_id" {
    description = "ID of the security group"
    value       = module.security_group.sg_id
}

# Outputs from RDS module (if applicable)
output "rds_endpoint" {
    description = "RDS database endpoint"
    value       = module.rds.db_endpoint
    sensitive   = true
}

# Outputs from EC2 module (if applicable)
output "instance_ids" {
    description = "IDs of EC2 instances"
    value       = module.ec2.instance_ids
}