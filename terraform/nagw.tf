#create elastic IP
resource "aws_eip" "depi_ip" { 
}


#create the nat gateway
resource "aws_nat_gateway" "depi_natgw" {
  allocation_id = aws_eip.depi_ip.id
  subnet_id     = aws_subnet.depipublic.id

}