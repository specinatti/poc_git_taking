resource "aws_internet_gateway" "igw-vpc-192-170-0-0" { 
  vpc_id = aws_vpc.vpc-192-170-0-0.id


  tags = { 
    Name = "igw-vpc-192-170-0-0"
  }
}
