resource "aws_dynamodb_table" "table" {
  name         = "${terraform.workspace}-Terraform-Tasks-Table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
