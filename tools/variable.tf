variable "instance_type" {}
variable "tag_name" {}
variable "zone_id" {}
variable "policy_instance_type"{}
variable "dummy_policy" {
  default = ["ec2:DescribeInstanceTypes"]
}