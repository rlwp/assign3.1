
terraform {
  backend "s3" {
    bucket = "sctp-ce9-tfstate"
    key    = "rudylee_ce9.tfstate" # Change underscore to your name
    region = "us-east-1"
  }
}
