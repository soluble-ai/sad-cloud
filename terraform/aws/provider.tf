provider "aws" {
  profile = var.profile
  region  = var.aws_region
}

provider "aws" {
  alias      = "plain_text_access_keys_provider"
  region     = var.aws_region
  access_key = "EXAMPLELWCIFDLYY4U"
  secret_key = "EimHecJPGLyFWeu4KW/rnabWyacaPxRfiCYEXAMPLEKEY"
}

provider "external" {
  version = "~> 1.0"
}

provider "kubernetes" {
}

terraform {
  backend "s3" {
    encrypt = true
  }
}
