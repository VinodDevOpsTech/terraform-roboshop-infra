locals {
    catalogue_sg_id= data.aws_ssm_parameter.catalogue_sg_id.value
    ami = data.aws_ami.DevOps.id
    common_name = "${var.project}-${var.environment}"
    private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    common_tags ={
        Project = "${var.project}"
        Environment = "${var.environment}"
    }
}