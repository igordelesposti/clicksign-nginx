resource "aws_instance" "nginx-web" {
  tags = merge(
    local.tags,
    {
      Name = "nginx-web"
    }
  )
  instance_type = "t2.micro"
  ami           = "ami-052efd3df9dad4825"
  user_data     = file("userdata.tpl")
  vpc_security_group_ids = [
    aws_security_group.nginx-web_sg.id
  ]
  depends_on = [
    module.vpc,
    aws_security_group.nginx-web_sg
  ]
}

# Security group
resource "aws_security_group" "nginx-web_sg" {
  tags = merge(
    local.tags,
    {
      Name = "nginx-web_sg"
    }
  )
  name        = "nginx-web_sg"
  description = "allow http on port 80"
  vpc_id      = module.vpc.default_vpc_id
  depends_on = [
    module.vpc,
  ]

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
