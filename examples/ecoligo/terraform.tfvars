project_name = "ecoligo"
region       = "us-east-1"
user_data    = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install nginx1 -y 
    sudo systemctl enable nginx
    sudo systemctl start nginx
  EOF
