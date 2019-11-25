data "aws_ami" "packer-build-terraform" {
  most_recent      = true
  name_regex       = "packer"
  owners           = ["805664109726"]

}



resource "aws_instance" "web" {
  ami           = "${data.aws_ami.packer-build-terraform.id}"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "endpoint"
  associate_public_ip_address = true
  subnet_id       = "subnet-0292e63a287192212"
  vpc_security_group_ids = ["sg-07af8d526a070aaf4"]
  
  tags = {
    Name = "HelloWorld"
  }
}