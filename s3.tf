resource "aws_s3_bucket" "test"{
  bucket = "s3s4s6"
  acl = "public-read"
  tags = {
    Name = "my bucker"
  }
}
