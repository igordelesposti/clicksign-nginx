provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "k8s-key" {
  key_name   = "k8s-key"
  public_key = "ssh-rsa asdasdasd"
  # public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "nginx-web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "nginx-web"
  }
}

resource "aws_security_group_rule" "nginx-web" {
  name        = "nginx-web"
  description = "Allow HTTP traffic"

  //Regra de entrada permitindo qualquer porta de qualquer protocolo que venha dele mesmo
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  //Permitir o tráfico na porta 80 para qualquer IP (não recomendado para produção)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  //Permitir todo o tráfico externo para qualquer porta
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

