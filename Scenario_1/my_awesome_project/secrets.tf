resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "admin_secret" {
  name        = "${var.env}-db-admin-secret"
  description = "Secret for DB admin user"
  
  tags = {
    Environment = "${var.env}"
  }
}

resource "aws_secretsmanager_secret_version" "admin_secret_value" {
  secret_id     = aws_secretsmanager_secret.admin_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = random_password.password.result
  })

}