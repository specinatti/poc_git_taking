resource "aws_vpc" "vpc-192-170-0-0"  {
  cidr_block = "192.170.0.0/16"
  

  tags = {
    Name = "vpc-192-170-0-0"
  }
}


