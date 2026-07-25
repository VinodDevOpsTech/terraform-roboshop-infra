module "components" {
    for_each = var.component
    source = "git::https://github.com/VinodDevOpsTech/terraform-roboshop-components.git?ref=main"
    environment = var.environment
    component = each.key
    app_version = each.value.app_version
}