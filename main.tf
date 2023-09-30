module "cronjob-terraform-helm" {
  source               = "./module/"
  deployment_name      = "cronjob"
  deployment_path      = "./cronjobs/"
  repository           = "https://charts.bitnami.com/bitnami" 
  values_yaml          = <<EOF
jobs:
  uninstall-app:
    schedule: "*/1 * * * *"
    command:
      - "/bin/sh"
      - "-c"
    args: 
      - "kubectl delete pod nginx"

serviceAccount: 
  name: cronjob-sa
EOF  
}  

resource "kubernetes_role" "admin_role" {
  metadata {
    name = "admin-role"
    namespace = "default"
  }

  rule {
    api_groups = [""]
    resources = ["pods", "jobs", "deployments"]
    verbs = ["delete", "get", "list"]
  }
}
resource "kubernetes_role_binding" "cronjob_role_binding" {
  metadata {
    name = "cronjob-role-binding"
  }

  subject {
    kind = "ServiceAccount"
    name = "cronjob-sa"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "admin-role"  
  }
}


