#create s3 creation
resource "aws_s3_bucket" "name" {
    bucket = "ekbaataorsunlo"
  
}

#create DynamoDB_Table
resource "aws_dynamodb_table" "dbtable" {
 name = "mydynamotable"
 hash_key = "LockID"
 read_capacity = 20
 write_capacity = 20
 
 attribute {
   name = "LockID"
   type = "S"
 }
  
}