resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
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