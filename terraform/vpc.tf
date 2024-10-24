#create a vpc
resource "aws_vpc" "depivpc" {
  cidr_block = "10.0.0.0/16"
}
