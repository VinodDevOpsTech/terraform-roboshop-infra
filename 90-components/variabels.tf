variable "project" {
    default = "roboshop"
}
variable "environment" {
    default = "dev"
}
variable "app_version" {
    default = "v3"
}
variable "domain_name" {
    default = "maxdevopstech.online"
}
variable "component" {
    default = {
        catalogue = {
            rule_priority = 10,
            app_version = "v3"
        }
        user = {
            rule_priority = 20,
            app_version = "v3"
        }
        cart = {
            rule_priority = 30,
            app_version = "v3"
        }
        shipping = {
            rule_priority = 40,
            app_version = "v3"
        }
        payment = {
            rule_priority = 50,
            app_version = "v3"
        }
        frontend = {
            rule_priority = 10,
            app_version = "v3"
        }
    }
}
