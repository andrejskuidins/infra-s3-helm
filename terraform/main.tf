resource "aws_s3_bucket" "users" {
  for_each = toset(local.usernames)

  bucket = lower("my-tf-test-bucket-${each.key}")
}

resource "aws_s3_bucket_policy" "allow_user" {
  for_each = aws_s3_bucket.users

  bucket = aws_s3_bucket.users[each.key].id
  policy = data.aws_iam_policy_document.allow_user[each.key].json
}

data "aws_iam_policy_document" "allow_user" {
  for_each = aws_s3_bucket.users

  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::959483702420:role/${each.key}"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.users[each.key].arn,
      "${aws_s3_bucket.users[each.key].arn}/*",
    ]
  }
}

output "bucket_names" {
  value = [
    for name in values(aws_s3_bucket.users).*.id : name
  ]
}
