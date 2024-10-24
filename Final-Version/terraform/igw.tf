#create the Internet gatway
resource "aws_internet_gateway" "depigw" {
  vpc_id = aws_vpc.depivpc.id
}