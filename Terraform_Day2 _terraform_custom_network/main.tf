#create vpc
resource "aws_vpc" "adhvik" {
  cidr_block = "10.0.0.0/16"
  tags = {
     Name = "MY_VPC"
  }
}

#create IG and attach to vpc
resource "aws_internet_gateway" "IG" {
vpc_id = aws_vpc.adhvik.id
tags = {
  Name = "PubIG"
}

}

#create subnet and attach subnet to VPC
resource "aws_subnet" "Pubsub1" {
  vpc_id = aws_vpc.adhvik.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "rv"
  }
}

#create RT and attch RT to IG
resource "aws_route_table" "PubRT" {
vpc_id = aws_vpc.adhvik.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
}

  
}

#attch RT to subnet
resource "aws_route_table_association" "subnetass" {
    route_table_id = aws_route_table.PubRT.id
    subnet_id = aws_subnet.Pubsub1.id

  
}
#create ec2
resource "aws_instance" "ec2teraaws" {
    ami=var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    

    tags = {
    Name = "ec2lo"
    }

}

