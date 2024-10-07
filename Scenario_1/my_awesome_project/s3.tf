module "s3_static_page" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.2.0"

  bucket = "${var.env}-static-page-for-cosmos-space-6729913"
  acl    = "public-read"

  attach_policy = true
  policy        = data.aws_iam_policy_document.s3_bucket_policy.json

  website = {
    index_document = file("${path.module}/files/index.html")
  }

}


data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_static_page.s3_bucket_arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}


resource "aws_s3_object" "index" {
  bucket       = module.s3_static_page.s3_bucket_arn
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
  acl          = "public-read"
}
