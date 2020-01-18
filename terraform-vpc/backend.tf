terraform {
  backend "s3" {
    bucket = "arjunsreepad-jenkins"
    key    = "tfstate/vpc.tfstate"
    region = "us-west-2"
  }
}