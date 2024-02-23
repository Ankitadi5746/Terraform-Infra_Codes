
 terraform {
backend "s3" {
    bucket         = "mybuckets144"  
    key            = "terraform.tfstate" 
    region         = "us-east-1"
    
}
}