locals {
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    common_name = "${var.project}-${var.environment}"
    public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
    common_tags ={
        Project = "${var.project}"
        Environment = "${var.environment}"
    }
}