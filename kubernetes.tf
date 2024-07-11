resource "kubernetes_secret" "tls_secret" {
  metadata {
    name      = "mongo-issuer-${var.name}"
    namespace = var.namespace
    labels    = var.labels
  }

  type = "kubernetes.io/tls"

  data = {
    "ca.crt"  = local.issuer_secret["ca.crt"]
    "tls.key" = local.issuer_secret["tls.key"]
    "tls.crt" = local.issuer_secret["tls.crt"]
  }
}

resource "kubernetes_manifest" "issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Issuer"
    metadata = {
      name      = "mongo-${var.name}"
      namespace = var.namespace
      labels    = var.labels
    }
    spec = {
      ca = {
        secretName = kubernetes_secret.tls_secret.metadata[0].name
      }
    }
  }
  depends_on = [kubernetes_secret.tls_secret]
}

resource "kubernetes_manifest" "certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"
    metadata = {
      name      = var.certificate_name
      namespace = var.namespace
      labels    = var.labels
    }
    spec = {
      secretName = "m-u-${var.certificate_name}"
      commonName = var.name
      subject = {
        organizations = [var.organization]
      }
      issuerRef = {
        name  = var.name
        group = "cert-manager.io"
        kind  = "Issuer"
      }
      usages = ["client auth", "digital signature"]
      additionalOutputFormats = [
        { type = "CombinedPEM" }
      ]
    }
  }
  depends_on = [kubernetes_manifest.issuer]
}
