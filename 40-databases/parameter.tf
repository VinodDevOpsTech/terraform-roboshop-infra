resource "aws_ssm_parameter" "sg_id" {
    name  = "/${var.project}/${var.environment}/mysql_root_password" # /roboshop/dev/backend_alb_sg_id, /roboshop/dev/mongodb_sg_id
    type  = "SecureString"
    value = var.mysql_root_password
    overwrite = true
}