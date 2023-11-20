provider "kubernetes" {
  experiments {
    manifest_resource = true
  }
  host                   = aws_eks_cluster.cluster-vpc-192-170-0-0.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.cluster-vpc-192-170-0-0.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster-auth.token
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.cluster-vpc-192-170-0-0.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.cluster-vpc-192-170-0-0.certificate_authority.0.data)
    token		   = data.aws_eks_cluster_auth.cluster-auth.token
    
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.cluster-vpc-192-170-0-0.name]
      command     = "aws"
    }
  }
}


resource "helm_release" "S3" {
  name 		= "k8sgpt"
  repository	= "s3://k8sgpt"
  chart		= "k8sgpt-operator"
  version 	= "0.0.22"
  namespace	= var.namespace-monitoramento
  create_namespace = true

  set { 
    name 	= "serviceMonitor.enable"
    value	= true
  }

  set { 
    name	= "grafanaDashboard.enable"
    value	= true
  }

  set { 
    name 	= "manager\\.resources"
    value 	= yamlencode({
      limits	= {
        cpu	= "200m"
        memory	= "50Mi"
      }
      requests	= {
        cpu	= "100m"
        memory	= "30Mi"
      }
    })
  }
}


