resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }
  tags = {
    Name = var.tag_name
  }
}
resource "aws_route53_record" "route" {
  name         =   var.tag_name
  type         =   "A"
  zone_id      =   var.zone_id
  records      =   [aws_instance.instance.public_ip]
  ttl          =    50
}
#  to create an IAM role for an entity,here entity means ec2 resource
# here "aws_iam_policy_document" is used to assume the role to grant the permission temporary for the role
resource "aws_iam_role" "instance_role" {
  name               = "${var.tag_name}-instance-role"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
  tags = {
    Name = "${var.tag_name}-role"
  }
}
// associate iam role with instance profile arn
resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.tag_name}-instance-profile"
  role = aws_iam_role.instance_role.name
  tags = {
    Name = "${var.tag_name}-instance-profile"
  }
}
# to allow which services are allowed for ec2 instances,for this we have to create inline policy
# here aws_iam_role_policy is an inline policy to create an inline policy and attached to the role
resource "aws_iam_role_policy" "iam_role_policy" {
  name = "${var.tag_name}-role-policy"
  role = aws_iam_role.instance_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action =var.policy_instance_type,

        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

}

