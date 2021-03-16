resource "aws_security_group" "allow_all" {
    name = "allow all"
    description = "Allow all inbound and outbound traffic from VPC"
    ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      self = true
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      self = true
  }
  vpc_id = aws_vpc.main.id
  tags = {
     Name = "allow all"
  }
}

/* Security group for the nat server */
resource "aws_security_group" "nat" {
  name = "NAT server security group"
  description = "Security group for nat instances that allows SSH and VPN traffic from internet. Also allows outbound HTTP[S]"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 1194
    to_port   = 1194
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "nat server security group"
  }
}

/* Security group for the web app*/
resource "aws_security_group" "web" {
  name = "web app security group"
  description = "Security group for web that allows web traffic from internet"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "soluble-sg-example"
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  public_key = "Sample SSH key goes here"
}
