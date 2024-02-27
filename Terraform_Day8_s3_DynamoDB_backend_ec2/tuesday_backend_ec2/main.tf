#now we will finally create one ec2 instance to check wether lock is geting initiate and realse or not so that first choise to apply will be my ec2 first then s3 by terraform.tfstate and terraform.tf state will not get confuse which to apply first as we apply lock it will definetly help ec2 to get 1st apply by terraform.tfstate

#create ec2
resource "aws_vpc" "custnw" {
    cidr_block =  "10.0.0.0/16"
    tags = {
      Name = "ankit_vpc"
    } 
}
resource "aws_internet_gateway" "custnw" {
vpc_id = aws_vpc.custnw.id
tags = {
  Name = "Ankit Internet Gateway"
}
}
resource "aws_subnet" "custnw" {
vpc_id = aws_vpc.custnw.id
cidr_block = "10.0.0.0/24"
tags = {
  Name = "Ankit subnet"
}
}
resource "aws_route_table" "custnw" {
vpc_id = aws_vpc.custnw.id
tags = {
  Name = "Ankit Rt"
}
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.custnw.id
}
}
resource "aws_route_table_association" "custnw" {
route_table_id = aws_route_table.custnw.id
subnet_id = aws_subnet.custnw.id
}
resource "aws_security_group" "custnw_sg" {
    name = "custnw_sg"
    description = "Allow TLS inbound traffics"
    vpc_id = aws_vpc.custnw.id

    
    ingress {
    description = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    }
}
resource "aws_instance" "custnw" {
ami = "ami-0440d3b780d96b29d"
instance_type = "t2.micro"
key_name = "adhvik"
subnet_id = aws_subnet.custnw.id
associate_public_ip_address = true
tags = {
  Name = "CustANKITec2"
}
}

