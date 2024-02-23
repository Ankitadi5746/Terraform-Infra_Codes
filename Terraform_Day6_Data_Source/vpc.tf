#create vpc
resource "aws_vpc" "custnw" {
    cidr_block =  "10.0.0.0/16"
    tags = {
      Name = "ankit_vpc"
    } 
}
#create Internet Gateway and attach to VPC
resource "aws_internet_gateway" "custnw" {
vpc_id = aws_vpc.custnw.id
tags = {
  Name = "Ankit Internet Gateway"
}
}
#create subnet  attach to vpc

resource "aws_subnet" "custnw" {
vpc_id = aws_vpc.custnw.id
cidr_block = "10.0.0.0/24"
tags = {
  Name = "Ankit subnet"
}
}

#create RT and attach to vpc 
resource "aws_route_table" "custnw" {
vpc_id = aws_vpc.custnw.id
tags = {
  Name = "Ankit Rt"
}
  #associate route table with internetgateway
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.custnw.id
}
}
#associate route table with subnet 
resource "aws_route_table_association" "custnw" {
route_table_id = aws_route_table.custnw.id
subnet_id = aws_subnet.custnw.id
}
#cust security group
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