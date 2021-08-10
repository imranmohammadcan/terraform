data "aws_vpc" "sunny" {
    default = true
}

data "aws_route_table" "sunny2" {
    filter {
        name = "tag:Name"
        values = ["test-1"]
    }
}
output "route" {
    value = data.aws_route_table.sunny2
}

output "vpc" {
    value = data.aws_vpc.sunny
}
resource "aws_subnet" "subnet2-public" {
    vpc_id = "${data.aws_vpc.sunny.id}"
    cidr_block = "${var.public_subnet2_cidr}"
    availability_zone = "us-east-2c"

    tags = {
        Name = "${var.public_subnet2_name}"
    }

}

resource "aws_route_table_association" "terraform-public" {
    subnet_id = "${aws_subnet.subnet2-public.id}"
    route_table_id = "${data.aws_route_table.sunny2.id}"
}

