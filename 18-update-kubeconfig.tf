resource "null_resource" "kubectl" {
    provisioner "local-exec" {
        command = "aws eks --region us-east-1 update-kubeconfig --name cluster-vpc-192-170-0-0"
    }
}
