resource "aws_s3_bucket" "bucket" {
  bucket = var.name
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.access
}

resource "aws_s3_bucket_versioning" "versioning"{
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = <<POLICY
   {
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "s3:ListBucket"
         ],
        "Condition": {
          "StringEquals": {"aws:PrincipalOrgID":["${var.organization_id}"]}
        },
        "Principal": "${var.principal}",
         "Resource": "${aws_s3_bucket.bucket.arn}"
      },
      {
         "Effect":"Allow",
         "Action":[
            "s3:GetObject",
            "s3:PutObject"
         ],
        "Condition": {
          "StringEquals": {"aws:PrincipalOrgID":["${var.organization_id}"]}
        },
        "Principal": "${var.principal}",
         "Resource": "${aws_s3_bucket.bucket.arn}/*"
      }
   ]
  }
  POLICY
}