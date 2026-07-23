resource "aws_ssm_parameter" "alb_listener" {
    name  = "/${var.project}/${var.environment}/backend_alb_listener_arn"
    type  = "String"
    value = aws_lb_listener.http.arn
    overwrite = true
}