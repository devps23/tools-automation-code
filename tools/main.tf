resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
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