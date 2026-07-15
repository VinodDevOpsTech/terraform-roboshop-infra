resource "aws_instance" "mongodb" {
    ami = data.aws_ami.DevOps.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.mongodb_sg_id]
    subnet_id = local.database_subnet_ids
    
    
    tags = merge(
        {
        Name = "${local.common_name}-mongodb",
        },
        local.common_tags
)
}