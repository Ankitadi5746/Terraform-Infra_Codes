output "publicip" {
    value = aws_instance.MrSingh.public_ip
  
}

output "privateip" {
    value = aws_instance.MrSingh.private_ip
    sensitive = true

  
}

output "publicdns" {
    value = aws_instance.MrSingh.public_dns
  
}

output "privateipdns" {
    value = aws_instance.MrSingh.private_dns
  
}