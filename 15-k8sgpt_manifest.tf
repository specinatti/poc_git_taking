resource "kubectl_manifest" "kind_k8sgpt" {

  
  depends_on = [kubectl_manifest.k8sgpt_clusterrolebinding]

  yaml_body = <<-EOF
    apiVersion: core.k8sgpt.ai/v1alpha1
    kind: K8sGPT
    metadata:
      name: k8sgpt-sample
      namespace: k8sgpt-operator-system
    spec:
      ai:
        enabled: true
        model: gpt-3.5-turbo
        backend: openai
        secret:
          name: k8sgpt-sample-secret
          key: openai-api-key
      noCache: false
      version: v0.3.18
    EOF
}

