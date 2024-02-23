provider "aws" {
  access_key = "AKIAWTHDN6YULBTREIUD"
  secret_key = "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"
  region = "us-east-1"
}


resource "aws_instance" "importec2" {
   ami = "ami-0440d3b780d96b29d"
   instance_type = "t2.micro"
   key_name = "whitehat"
   availability_zone = "us-east-1b"
   tags = {
    Name = "beautiful instance"
   }
   
}
