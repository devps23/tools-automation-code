terraform {
  backend "s3" {
    bucket = "bucketinfo23"
    key    = "bucketinfo23/test"
    region = "us-east-1"
  }
}
