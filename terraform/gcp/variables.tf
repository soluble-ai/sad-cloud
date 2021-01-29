variable "region" {
  type = string
  default = "us-west-2"
}

variable "kubernetes_version" {
  default = "1.16.8"
}

variable "username" {
   type = string
   default = "ubuntu"
}

variable "password" {
  type = string
  default = "ubuntu"
}

variable "cluster_name" {
  type = string
  default = "soluble-gcp-example-cluster"
}
