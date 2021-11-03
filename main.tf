
resource "aws_iam_policy" "GH-Upload-To-S3" {
  name        = "GH-Upload-To-S3"
  description = "Github actions application policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${var.aws_codedeploy_bucket}",
        "arn:aws:s3:::${var.aws_codedeploy_bucket}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "ghaction_app_policy_attachment" {
  user       = var.aws_iam_user
  policy_arn = aws_iam_policy.GH-Upload-To-S3.arn
}