module "web_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"

  name = "web-${var.env}"

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.key_name

  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [module.web_sg.security_group_id]

  associate_public_ip_address = false

  monitoring = true

  tags = {
    Name        = "web-${var.env}"
    Environment = var.env
    Terraform   = "true"
  }
}

# Example data source for latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
