variable "tools" {
  default = {
#     prometheus={
#       instance_type="t3.micro"
#       policy_instance_type=["ec2:DescribeInstances"]
#     }
    vault = {
      instance_type= "t3.micro"
      policy_instance_type= []
    }
#     elk = {
#       instance_type= "t3.large"
#       policy_instance_type= []
#     }
  }
}
    jenkins={
       instance_type="t3.micro"
       policy_instance_type= []

}
variable "zone_id" {
  default = "Z09583601MY3QCL7AJKBT"
}
