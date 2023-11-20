resource "kubectl_manifest" "k8sgpt_clusterrolebinding" { 

depends_on = [kubectl_manifest.k8sgpt_clusterrole]

yaml_body = <<-EOF
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    app.kubernetes.io/name: clusterrolebinding
    app.kubernetes.io/instance: manager-rolebinding
    app.kubernetes.io/component: rbac
    app.kubernetes.io/created-by: k8sgpt-operator
    app.kubernetes.io/part-of: k8sgpt-operator
    app.kubernetes.io/managed-by: kustomize
  name: manager-rolebinding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: manager-role
subjects:
- kind: ServiceAccount
  name: release-k8sgpt-operator-controller-manager
  namespace: k8sgpt-operator-system
EOF
}
