terraform {
  backend "s3" {
    bucket = "bucketinfo23"
    key    = "test/demo"
    region = "us-east-1"
  }
}
