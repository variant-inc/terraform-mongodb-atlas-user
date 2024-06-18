resource "kubernetes_manifest" "certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"
    metadata = {
      name      = var.certificate_name
      namespace = var.namespace
      labels    = var.certificate_labels
    }
    spec = {
      secretName = var.certificate_name
      commonName = var.name
      subject = {
        organizations = [var.organization]
      }
      issuerRef = {
        name  = lower(var.project_name)
        group = "cert-manager.io"
        kind  = "ClusterIssuer"
      }
      usages = ["client auth", "digital signature"]
    }
  }
}