output "id" {
  value       = ["${aws_instance.anything.*.id}"]
}
output "public_dns" {
  value       = ["${aws_instance.anything.*.public_dns}"]
}
output "vpc_security_group_ids" {
  value       = ["${aws_instance.anything.*.vpc_security_group_ids}"]
}
output "public_ip" {
  value       = ["${aws_instance.anything.*.public_ip}"]
}
output "vpc_id" {
  value       = ["${aws_vpc.default.*.id}"]
}