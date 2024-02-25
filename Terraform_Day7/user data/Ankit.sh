#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start  
sudo systemctl enable httpd
echo "<h1>MYSTERIOUS WORLD OF ANKIT</h1>","<p>you all are kind welcome to it</p>" > /var/www/html/index.html
