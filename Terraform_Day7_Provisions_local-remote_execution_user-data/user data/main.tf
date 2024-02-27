#create one fresh EC2 instance our moto is to being a user we try to configure apache web server 
#configuring html script and through terraform we can run ec2 instance public ip to browse

resource "aws_instance" "userdata" {
ami = "ami-0440d3b780d96b29d"
instance_type = "t2.micro"
key_name = "ee"
user_data= file ("Ankit.sh")
}

# we need to configure security group but before we need to configure vpc so that we can configure http
# we can run the apache web sevrer
resource "aws_vpc" "userdataVPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "UserVPC"
    }
  
}
resource "aws_security_group" "UserSG" {
    name = "UserSG"
    description = "Allow TLS inbound traafics"
    vpc_id = aws_vpc.userdataVPC.id
    ingress {
        description = "http from VPC"
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}