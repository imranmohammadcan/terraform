resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_name}"
    }
}
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
        tags = {
        Name = "${var.IGW_name}"
    }
}

resource "aws_subnet" "subnets" {
    vpc_id = "${aws_vpc.default.id}"
    count = 3
    cidr_block = "${element(var.blocks, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"

    tags = {
        Name = "Terraform-subnet-${count.index+1}"
    }
}

resource "aws_route_table" "terraform-public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "${var.Main_Routing_Table}"
    }
}
resource "aws_route_table_association" "terraform-public" {
    count = "${length(var.blocks)}"
    subnet_id = "${element(aws_subnet.subnets.*.id, count.index)}"
    route_table_id = "${aws_route_table.terraform-public.id}"
}