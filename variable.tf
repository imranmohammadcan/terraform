variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "instance_type" {}
variable "azs" {
   type = list
   default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
variable "ami" {}
variable "ec2_count" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "blocks" {
    type = list
    default = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}
variable Main_Routing_Table {}
variable "database_name" {}
variable "database_user" {}
variable "database_password" {}
variable "storage_type" {}
variable "allocated_storage" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "parameter_group_name" {}
variable "region_ami" {
    type = map
    default = {
        us-east-1 = "ami-0c2b8ca1dad447f8a"
        us-east-2 = "ami-0443305dabd4be2bc"
     }
}
