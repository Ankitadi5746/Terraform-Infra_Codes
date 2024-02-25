#create key pair define name of the key and path of local public from locla system
resource "aws_key_pair" "AnkitGoldenKey" {
key_name = "BronzeMrSingh"
public_key = file("~/.ssh/id_rsa.pub")
}

#Create Security group but before that create a VPC so that http port can be enabled for apache web server
resource "aws_vpc" "Myownvpc" {
cidr_block = "10.0.0.0/16"
tags = {
  Name = "MyVPC"
}
  
}
#create a fresh ec2 instance and pass key_pair value here in key_name make aconnection to connect to ec2 user in aws console
resource "aws_instance" "ANKITEC2"{
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"
    key_name = aws_key_pair.AnkitGoldenKey.key_name

    
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
      }

#File provisioner to copy a file from local to the remote EC2 instance
# let me create one file name as India and i will send that to ec2 from local
provisioner "file" {
    source = "India"
    destination = "/home/ec2-user/India"
}


}