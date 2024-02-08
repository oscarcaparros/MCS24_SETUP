resource "aws_cloud9_environment_ec2" "cloud9_env" {
  instance_type = var.instance_type
  image_id      = "amazonlinux-2023-x86_64"
  name          = "${var.user_name}-env"
  subnet_id     = var.subnet_id
  tags          = var.tags
}

data "aws_instance" "cloud9_instance" {
  filter {
    name = "tag:aws:cloud9:environment"
    values = [aws_cloud9_environment_ec2.cloud9_env.id]
  }
}

resource "aws_eip" "cloud9_eip" {
  domain = "vpc"
  instance = data.aws_instance.cloud9_instance.id
  tags     = var.tags 
}

resource "aws_cloud9_environment_membership" "cloud9_user" {
  environment_id = aws_cloud9_environment_ec2.cloud9_env.id
  permissions    = "read-write"
  user_arn       = var.user_arn
}


