resource "aws_s3_bucket" "test"{
  bucket = "s3s4s6"
  acl = "public-read"
  tags = {
    Name = "my bucker"
  }
}


#dynamodb-lock
resource "aws_dynamodb_table" "dynamodb-terraform" {
    name = "terraform-state-lock-dynamo"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    atribute {
        name = "LockID"
        type = "s"
    }
    tags {
      Name = " dynamoDB terraform"
    }
}

terraform {
    backend "s3" {
        encrypt = true
        bucket = "s3s4s6"
        dynamodb_table = "terraform-state-lock-dynamo"
        key = "terraform.tfstate"
        region = "us-east-2"
    }
}
