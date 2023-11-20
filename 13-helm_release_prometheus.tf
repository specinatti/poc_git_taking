resource "helm_release" "prometheus" {
  name		= "prom"
  chart		= "kube-prometheus-stack"
  repository	= "https://prometheus-community.github.io/helm-charts"
  namespace	= var.namespace-monitoramento
  wait		= true
  reset_values	= true
  max_history	= 3

  set { 

    name 	= "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
    value	= false
  }
}
