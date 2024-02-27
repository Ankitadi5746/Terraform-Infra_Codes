##create backend folder in created s3 bucket where terraform.tfstate file will be store while creating ec2



terraform {
  backend "s3" {
    bucket = "ekbaataorsunlo"
    dynamodb_table = "mydynamotable"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}
