resource "aws_db_instance" "test-rds" {
  allocated_storage             = 20
  storage_type                  = "gp2"
  engine                        = "mariadb"
  engine_version                = "10.3"
  instance_class                = "db.t2.micro"
  name                          = "studentapp"
  username                      = "${var.DBUSER}"
  password                      = "${var.DBPASS}"
  parameter_group_name          = "default.mariadb10.3"
  skip_final_snapshot           = true
  identifier                    = "studentapp-rds-test"
  db_subnet_group_name          = "terrafrom-public-subnet-group"
  vpc_security_group_ids        = ["sg-006a0050e443db8ab"]
}