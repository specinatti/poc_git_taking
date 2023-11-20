data "aws_eks_cluster_auth" "cluster-auth" {
  depends_on = [aws_eks_cluster.cluster-vpc-192-170-0-0]
  name       = aws_eks_cluster.cluster-vpc-192-170-0-0.name
}
