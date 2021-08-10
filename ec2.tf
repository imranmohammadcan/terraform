
resource "aws_instance" "anything" {
    ami = lookup(var.region_ami, var.aws_region)
    instance_type = var.instance_type
    count = 2
    subnet_id = "${element(aws_subnet.subnets.*.id, count.index)}"
    vpc_security_group_ids = ["${data.aws_security_group.sunny2.id}"]
    associate_public_ip_address = true
    key_name = "${var.key_name}"
    tags = {
        Name = "test_terra-${count.index+1}"
     }
}
