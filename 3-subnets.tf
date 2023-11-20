resource "aws_subnet" "private-us-east-1a-vpc-192-170-0-0" { 
  vpc_id              = aws_vpc.vpc-192-170-0-0.id
  cidr_block          = "192.170.0.0/19"
  availability_zone   = "us-east-1a"
  
  tags = { 
    
    "Name"                            = "private-us-east-1a-vpc-192-170-0-0"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/cluster-vpc-192-170-0-0"      = "owned"
  } 
}
  

resource "aws_subnet" "private-us-east-1b-vpc-192-170-0-0" { 
  vpc_id              = aws_vpc.vpc-192-170-0-0.id
  cidr_block          = "192.170.32.0/19"
  availability_zone        = "us-east-1b"
  
  
  tags = { 
 
    "Name"                              = "private-us-east-1b-vpc-192-170-0-0"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/cluster-vpc-192-170-0-0"         = "owned"
  }
}

resource "aws_subnet"  "public-us-east-1a-vpc-192-170-0-0"  {
  vpc_id  		  = aws_vpc.vpc-192-170-0-0.id
  cidr_block		  = "192.170.64.0/19"
  availability_zone		  = "us-east-1a"
  map_public_ip_on_launch =  true

  tags = { 

  "Name"		       = "public-us-east-1a-vpc-192-170-0-0"
  "kubernetes.io/role/elb"     = "1"
  "kubernetes.io/cluster/cluster-vpc-192-170-0-0" = "owned"

  } 

}

resource "aws_subnet"  "public-us-east-1b-vpc-192-170-0-0"  {
  vpc_id			= aws_vpc.vpc-192-170-0-0.id
  cidr_block			= "192.170.96.0/19"
  availability_zone             = "us-east-1b"
  map_public_ip_on_launch       =  true

  tags = { 

  "Name"			= "public-us-east-1b-vpc-192-170-0-0"
  "kubernetes.io/role/elb" 	= "1"
  "kubernetes.io/cluster/cluster-vpc-192-170-0-0"  = "owned"

  }

}

