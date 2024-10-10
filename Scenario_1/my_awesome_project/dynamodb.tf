resource "aws_dynamodb_table" "table" {
  name         = "TerraformTasksTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
