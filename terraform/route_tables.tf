#create the route table for the public subnet
resource "aws_route_table" "public_table" {
  vpc_id = aws_vpc.depivpc.id
}

#the routing
resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.depigw.id
}

#associate the route table "public_table" to the subnet "depipublic"
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.depipublic.id
  route_table_id = aws_route_table.public_table.id
}


##create the route table for the private subnet
#resource "aws_route_table" "private_table" {
#  vpc_id = aws_vpc.depivpc.id
#}
#
##the routing
#resource "aws_route" "private_route" {
#  route_table_id            = aws_route_table.private_table.id
#  destination_cidr_block    = "0.0.0.0/0"
#  gateway_id = aws_nat_gateway.depi_natgw.id
#}
#
##associate the route table "private_table" to the subnet "depiprivate"
#resource "aws_route_table_association" "private" {
#  subnet_id      = aws_subnet.depiprivate.id
#  route_table_id = aws_route_table.private_table.id
#}