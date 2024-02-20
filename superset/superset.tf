resource "kubernetes_deployment" "superset" {
  metadata {
    name = "superset"
    namespace = "default"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "superset"
      }
    }

    template {
      metadata {
        labels = {
          app = "superset"
        }
      }

      spec {
        container {
          image = "apache/superset"
          name  = "superset"

          env {
            name  = "SUPERSET_DB_URI"
            value = "mysql://myuser:mypassword@localhost:3306/superset_db"
          }

          volume_mounts {
            mount_path = "/app/superset_home"
            name       = "superset-storage"
          }

          resources {
            limits {
              cpu    = "1000m"
              memory = "1024Mi"
            }
            requests {
              cpu    = "500m"
              memory = "512Mi"
            }
          }

          volume_mounts {
            mount_path = "/etc/ssl/certs"
            name       = "ssl-certs"

          port {
            container_port = 8088
          
        }
      }
    }
  }
}


