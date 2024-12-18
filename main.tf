module "tools" {
  source = "./tools"
  for_each = var.tools
  instance_type = each.value["instance_type"]
  tag_name = each.key
  zone_id = var.zone_id
}