#create a public subnet
resource "aws_subnet" "depipublic" {
  vpc_id     = aws_vpc.depivpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
}


#create a private subnet
#resource "aws_subnet" "depiprivate" {
#  vpc_id     = aws_vpc.depivpc.id
#  cidr_block = "10.0.2.0/24"
#}