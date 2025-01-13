module "mongo" {
  source = "./modules/mongo"
  kubernetes_namespace = "pac-man"
}

module "pac-man" {
  source      = "./modules/pac-man"
  kubernetes_namespace = "pac-man"
  depends_on  = [module.mongo]
}

resource "kubernetes_namespace" "pac-man" {
  metadata {
    annotations = {
      name = "pac-man_web_app"
    }

    labels = {
      namespace = "pac-man"
    }

    name = "pac-man"
  }
}
