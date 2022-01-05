

data "http" "install_ha" {
  url = "https://raw.githubusercontent.com/argoproj/argo-cd/v${var.argo_cd_version}/manifests/ha/install.yaml"
}


# ----------------------------------------------------------------------------------------------------------------------
# Namespaces
# ----------------------------------------------------------------------------------------------------------------------
resource "kubectl_manifest" "argo" {
    yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: argocd
YAML
}
# ----------------------------------------------------------------------------------------------------------------------
# ArgoCD Resources
# ----------------------------------------------------------------------------------------------------------------------
locals {
  resources = split("\n---\n",  data.http.install_ha.body)
}

resource "kubectl_manifest" "resource" {
  count = length(local.resources)
  yaml_body = element(local.resources, count.index)
  override_namespace = "argocd"
  depends_on = [kubectl_manifest.argo,]
}