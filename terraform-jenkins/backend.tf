terraform {
  backend "s3" {
    bucket = "arjunsreepad-jenkins"
    key    = "tfstate/jenkins.tfstate"
    region = "us-west-2"
  }
}