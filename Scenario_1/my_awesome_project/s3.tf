module "s3_static_page" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.2.0"

  bucket = "${var.env}-static-page-for-cosmos-space-6729913"


  website = {
    index_document = "index.html"
  }

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false


}

resource "aws_s3_bucket_policy" "public_access" {
  bucket = module.s3_static_page.s3_bucket_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${module.s3_static_page.s3_bucket_arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "index" {
  bucket       = module.s3_static_page.s3_bucket_id
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
}

