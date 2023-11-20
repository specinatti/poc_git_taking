resource "aws_route_table"  "private-vpc-192-170-0-0"  { 
  vpc_id = aws_vpc.vpc-192-170-0-0.id

  route = [
    { 
      cidr_block		 = "0.0.0.0/0"
      nat_gateway_id		 = aws_nat_gateway.nat-gw-vpc-192-170-0-0.id
      carrier_gateway_id	 = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id	 = ""
      gateway_id		 = ""
      instance_id		 = ""
      ipv6_cidr_block		 = ""
      local_gateway_id		 = ""
      network_interface_id	 = ""
      transit_gateway_id	 = ""
      vpc_endpoint_id		 = ""
      vpc_peering_connection_id	 = ""
    },
 
  ]


  tags = { 
    Name  = "private-vpc-192-170-0-0"
  }
 }

resource   "aws_route_table" "public-vpc-192-170-0-0" {
  vpc_id = aws_vpc.vpc-192-170-0-0.id
  
  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw-vpc-192-170-0-0.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""    },

  ]

  tags = { 
    Name = "public-vpc-192-170-0-0"
  }
}

resource "aws_route_table_association"  "private-us-east-1a-vpc-192-170-0-0" { 
  subnet_id		 = aws_subnet.private-us-east-1a-vpc-192-170-0-0.id
  route_table_id		 = aws_route_table.private-vpc-192-170-0-0.id
}

resource "aws_route_table_association"  "private-us-east-1b-vpc-192-170-0-0" {
  subnet_id		 = aws_subnet.private-us-east-1b-vpc-192-170-0-0.id
  route_table_id		 = aws_route_table.private-vpc-192-170-0-0.id
}

resource "aws_route_table_association" "public-us-east-1a-vpc-192-170-0-0"  { 
  subnet_id		 = aws_subnet.public-us-east-1a-vpc-192-170-0-0.id
  route_table_id            = aws_route_table.public-vpc-192-170-0-0.id
}

resource "aws_route_table_association" "public-us-east-1b-vpc-192-170-0-0"  { 
  subnet_id		 = aws_subnet.public-us-east-1a-vpc-192-170-0-0.id 
  route_table_id		 = aws_route_table.public-vpc-192-170-0-0.id
}
 
















































