resource "aws_iam_role" "k8sgpt-role-vpc-192-170-0-0" {
  name = "k8sgpt-role-vpc-192-170-0-0"
  
   assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn 		= "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role		        = aws_iam_role.k8sgpt-role-vpc-192-170-0-0.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
 role    = aws_iam_role.k8sgpt-role-vpc-192-170-0-0.name
}

resource "aws_eks_cluster" "cluster-vpc-192-170-0-0"   { 
  name		=  "cluster-vpc-192-170-0-0"
  role_arn      = aws_iam_role.k8sgpt-role-vpc-192-170-0-0.arn

  vpc_config {
    subnet_ids = [ 
      aws_subnet.private-us-east-1a-vpc-192-170-0-0.id,
      aws_subnet.private-us-east-1b-vpc-192-170-0-0.id,
      aws_subnet.public-us-east-1a-vpc-192-170-0-0.id,
      aws_subnet.public-us-east-1b-vpc-192-170-0-0.id
     ]   
  }
  
  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
} 
