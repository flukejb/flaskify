provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-dev"
}

resource "kubernetes_namespace" "flaskify_ns" {
  metadata {
    name = "flaskify"
  }
}

resource "kubernetes_deployment" "python_flaskify_deploy" {
  metadata {
    name      = "flaskify"
    namespace = kubernetes_namespace.flaskify_ns.metadata[0].name
    labels = {
      app = "flaskify-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = { 
        app = "flaskify-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "flaskify-app"
        }
      }
      spec {
        container {
          image = "hotpackets/flaskify-app"
          name  = "flaskify"
          port {
            container_port = 8080
          }
          resources {
            limits = {
              cpu    = "500m"
              memory = "256Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "128Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 8080
            }
            initial_delay_seconds = 10
            period_seconds        = 5
          }

          readiness_probe {
            http_get {
              path = "/"
              port = 8080
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "python_flaskify_svc" {
  metadata {
    name      = "flaskify"
    namespace = kubernetes_namespace.flaskify_ns.metadata[0].name
  }

  spec {
    selector = {
      app = "flaskify-app"
    }
    port {
      port        = 80
      target_port = 8080
    }
  }
}
