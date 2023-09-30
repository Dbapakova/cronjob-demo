resource "helm_release" "cronjob-deployment" {
  name       = var.deployment_name
  chart      = var.deployment_path
  wait      = false
  values = [
    var.values_yaml
  ] 
}
