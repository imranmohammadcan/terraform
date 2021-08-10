resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.subnet1-public.id, aws_subnet.subnet2-private.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
    allocated_storage = "${var.allocated_storage}"
    storage_type = "${var.storage_type}"
    engine = "${var.engine}"
    engine_version = "${var.engine_version}"
    instance_class = "${var.instance_class}"
    name = "${var.database_name}"
    username = "${var.database_user}"
    password = "${var.database_password}"
    parameter_group_name = "${var.parameter_group_name}"
    skip_final_snapshot = "true"
    db_subnet_group_name = "${aws_db_subnet_group.default.name}"
}
