resource "kubectl_manifest" "k8sgpt_clusterrole" { 

depends_on = [null_resource.kubectl]

yaml_body = <<-EOF
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  creationTimestamp: null
  name: manager-role
rules:
- apiGroups:
  - '*'
  resources:
  - '*'
  verbs:
  - '*'
- apiGroups:
  - core.k8sgpt.ai
  resources:
  - k8sgpts
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch
- apiGroups:
  - core.k8sgpt.ai
  resources:
  - k8sgpts/finalizers
  verbs:
  - update
- apiGroups:
  - core.k8sgpt.ai
  resources:
  - k8sgpts/status
  verbs:
  - get
  - patch
  - update
- apiGroups:
  - core.k8sgpt.ai
  resources:
  - results
  verbs:
  - create
  - delete
  - get
  - list
  - patch
  - update
  - watch 
EOF
}
