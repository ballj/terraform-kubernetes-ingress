module "ingress" {
  source    = "../"
  dns_fqdn  = "test.sandbox.development.cyark.net"
  namespace = "sandbox"
  service_name = "mayanedms-db-probe-timeout-app"
  service_port = 80
  object_prefix = "test"
  dns_zone = "sandbox.development.cyark.net"
  ingress_annotations = { "kubernetes.io/ingress.class" = "traefik", "traefik.ingress.kubernetes.io/router.tls" = true, "cert-manager.io/issuer"= "cyark-k8s-sandbox-issuer" }
}

# resource "kubernetes_service" "main" {
#   metadata {
#     name = "test"
#     namespace = "sandbox"
#   }
#   spec {
#     selector = {
#       app = "test"
#     }
#     session_affinity = "ClientIP"
#     port {
#       port        = 80
#       target_port = 8080
#     }

#     type = "ClusterIP"
#   }
# }

# resource "kubernetes_pod_v1" "example" {
#   metadata {
#     name = "terraform-example"
#     namespace = "sandbox"
#     labels = {
#       app = "test"
#     }
#   }

#   spec {
#     container {
#       image = "nginx:1.7.9"
#       name  = "example"

#       port {
#         container_port = 8080
#       }
#     }
#   }
# }
