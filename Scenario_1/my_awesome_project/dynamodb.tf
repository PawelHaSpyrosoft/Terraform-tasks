resource "aws_dynamodb_table" "table" {
  name         = "${var.env}-Terraform-Tasks-Table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
