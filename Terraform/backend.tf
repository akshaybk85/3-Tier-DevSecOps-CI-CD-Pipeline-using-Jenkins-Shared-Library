terraform {
  backend "s3" {
    bucket = "jenkinsbucketakshay"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

