provider "aws" {
  region     = "us-west-2"
  access_key = "uriueirndhuydbfhdjk334u5uii45"
  secret_key = "JJSUSTTERT3343556HYHDNHDKDKK"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
tags= {
Name= "myfirstserver"
}
}
