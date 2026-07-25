resource "aws_ssm_parameter" "certificate-arn" {
    name  = "/${var.project}/${var.environment}/certificate-arn"
    type  = "String"
    value = aws_acm_certificate.roboshop.arn
    overwrite = true
}