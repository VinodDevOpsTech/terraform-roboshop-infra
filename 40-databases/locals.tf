locals {
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
    common_name = "${var.project}-${var.environment}"
    database_subnet_ids = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    common_tags ={
        Project = "${var.project}"
        Environment = "${var.environment}"
    }
}