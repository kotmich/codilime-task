terraform {
  backend "s3" {
    bucket  = "mikot-codilime-task"
    key     = "mikot-codilime/backend.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}