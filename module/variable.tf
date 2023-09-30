variable "deployment_name" {
  type        = string
  description = "- (Required) Chart release name."
}

variable "deployment_path" {
  type        = string
  description = "- (Required) Path for the Chart."
}

variable "values_yaml" {
  type        = string
  description = "- (Required) Values.yaml file."
}

variable "repository" {
  type        = string
  description = "- (Required) Path for the Chart."
}