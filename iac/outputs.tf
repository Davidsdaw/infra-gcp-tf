# Outputs from VPC module
output "vpc_id" {
    description = "ID of the VPC"
    value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
    description = "IDs of public subnets"
    value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
    description = "IDs of private subnets"
    value       = module.vpc.private_subnets
}

# Outputs from EC2 module
output "ec2_instance_id" {
    description = "ID of EC2 instance"
    value       = module.ec2_instance.id
}

output "security_group_id" {
    description = "ID of the security group"
    value       = aws_security_group.ec2_sg.id
} 