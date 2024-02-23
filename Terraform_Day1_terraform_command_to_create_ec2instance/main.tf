resource "aws_instance" "developer2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags={
        Name = "ec2 instance"
    }
  
}