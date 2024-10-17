provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "kind-dev"  # For dev environment
}

resource "kubernetes_deployment" "python_flaskify_deploy" {
  metadata {
    name = "flaskify"
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
          image = "python:3.9-slim:latest"
          name  = "flaskify"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "python_flaskify_svc" {
  metadata {
    name = "flaskify"
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
