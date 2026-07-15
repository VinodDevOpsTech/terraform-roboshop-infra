locals {
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    common_name = "${var.project}-${var.environment}"
    database_subnet_ids = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    common_tags ={
        Project = "${var.project}"
        Environment = "${var.environment}"
    }
}