module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name           = var.ec2_name
  instance_type  = var.ec2_instance_type
  ami            = var.ec2_ami
  key_name       = var.ec2_key_name
  monitoring     = var.ec2_monitoring
  subnet_id      = var.ec2_subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  # EBS mínimo para Free Tier
  root_block_device = {
    volume_size = var.ec2_root_volume_size
    volume_type = var.ec2_root_volume_type
  }
  user_data = <<-EOF
              #!/bin/bash
              # Actualizamos el sistema
              yum update -y

              # Instalamos Docker
              amazon-linux-extras enable docker
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user

              # Instalamos dependencias para Minikube
              curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
              install minikube-linux-amd64 /usr/local/bin/minikube

              curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
              chmod +x ./kubectl
              mv ./kubectl /usr/local/bin/kubectl

              # Iniciamos Minikube (en modo rootless para Free Tier)
              minikube start --driver=none --memory=1024 --cpus=1

              EOF

  tags = {
    Name = var.ec2_name
  }
}


resource "aws_security_group" "ec2_sg" {
name        = "${var.ec2_name}-sg"
description = "Security group for EC2 instance"
vpc_id      = module.vpc.vpc_id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "${var.ec2_name}-sg"
}
}