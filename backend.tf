terraform {
  backend "s3" {
    bucket = "aws-gitt"
    key    = "aws-gitt"
    region = "ap-south-1"
  }
}

