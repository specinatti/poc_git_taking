resource "aws_eip"  "nat-eip-vpc-192-170-0-0"  { 
  vpc =  true
  
  tags = {
    Name = "nat-eip-vpc-192-170-0-0"
  }
  
}

resource "aws_nat_gateway" "nat-gw-vpc-192-170-0-0"  {
  allocation_id = aws_eip.nat-eip-vpc-192-170-0-0.id
  subnet_id     = aws_subnet.public-us-east-1a-vpc-192-170-0-0.id

  tags = { 
    Name = "nat-gw-vpc-192-170-0-0"
  }

  depends_on = [aws_internet_gateway.igw-vpc-192-170-0-0]
} 
