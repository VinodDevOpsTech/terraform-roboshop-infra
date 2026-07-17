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


resource "terraform_data" "mongodb" {
    triggers_replace = [
        aws_instance.mongodb.id,
    ]
        
    connection {
        type        = "ssh"
        user        = "ec2-user"
        password = "DevOps321"
        host        = aws_instance.mongodb.private_ip
    }

    provisioner "file" {
        source = "bootstrap.sh"
        destination = "/tmp/bootstrap.sh/"
        }

    provisioner "remote-exec" {
        inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
        ]
    }
    }