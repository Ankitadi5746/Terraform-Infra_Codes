
data "aws_subnet" "Datablocksubnet" {
id = "subnet-07632a2403d33995c"
  
}

data "aws_security_group" "Datablocksecuritygroup" {
id = "sg-00b6efa6dfd46e0f8"
  
}

resource "aws_instance" "datablck" {
  ami = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  key_name = "whitehat"
  subnet_id = data.aws_subnet.Datablocksubnet.id
  security_groups = [data.aws_security_group.Datablocksecuritygroup.id]
  tags = {
    Name = "MrSinghDeveloper"
  }
}