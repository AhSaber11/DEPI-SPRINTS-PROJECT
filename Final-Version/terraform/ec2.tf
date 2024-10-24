resource "tls_private_key" "depi-private-key" {
 algorithm = "RSA"
 rsa_bits  = 4096
}

## Upload an Existing Public Key
#resource "aws_key_pair" "Depi-kay-pair-public" {
#  key_name   = var.key_name
#  public_key = file("~/.ssh/id_rsa.pub")  # Path to your local public key
#}


resource "aws_key_pair" "Depi-key-pair" {
 key_name   = "depi"
 public_key = tls_private_key.depi-private-key.public_key_openssh

}

#  Save the private key to a file
resource "local_file" "private_key" {

 filename = "./depi"
 content  = tls_private_key.depi-private-key.private_key_pem
 file_permission = "0600"  # Ensure correct file permissions

}

# Save public key to a local file
resource "local_file" "public_key" {
  filename = "depi.pub"
  content  = tls_private_key.depi-private-key.public_key_openssh
}



#create security group 
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.depivpc.id

#   Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from anywhere (use caution)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows HTTP from anywhere
  }
  ingress {
    from_port   = 6606
    to_port     = 6606
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows HTTP from anywhere
  }

#   Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}



resource "aws_instance" "jenkins-instance" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  
  subnet_id = aws_subnet.depipublic.id
  key_name      = aws_key_pair.Depi-key-pair.key_name  # Use the created key pair
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]  # Attach the security group
  associate_public_ip_address = "true"

}
output "web_instance_ip" {
  value = aws_instance.jenkins-instance.public_ip
}
