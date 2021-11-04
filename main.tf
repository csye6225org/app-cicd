// ############################################
// # GH-Upload-To-S3
// ############################################

resource "aws_iam_policy" "policy_1" {
  name        = "GH-Upload-To-S3"
  description = "Github actions application policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": 
  [
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

resource "aws_iam_user_policy_attachment" "policy_attachment_1" {
  user       = var.aws_iam_user
  policy_arn = aws_iam_policy.policy_1.arn
}

// ############################################
// # GH-Code-Deploy
// ############################################

resource "aws_iam_policy" "policy_2" {
  name        = "GH-Code-Deploy"
  description = "Github actions codedeploy policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": 
  [
    {
      "Effect": "Allow",
      "Action": [
        "codedeploy:RegisterApplicationRevision",
        "codedeploy:GetApplicationRevision"
      ],
      "Resource": [
        "arn:aws:codedeploy:${var.aws_region}:${var.aws_account_id}:application:${var.aws_codedeploy_application_name}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codedeploy:CreateDeployment",
        "codedeploy:GetDeployment"
      ],
      "Resource": [
        "*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codedeploy:GetDeploymentConfig"
      ],
      "Resource": [
        "arn:aws:codedeploy:${var.aws_region}:${var.aws_account_id}:deploymentconfig:CodeDeployDefault.OneAtATime",
        "arn:aws:codedeploy:${var.aws_region}:${var.aws_account_id}:deploymentconfig:CodeDeployDefault.HalfAtATime",
        "arn:aws:codedeploy:${var.aws_region}:${var.aws_account_id}:deploymentconfig:CodeDeployDefault.AllAtOnce"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "policy_attachment_2" {
  user       = var.aws_iam_user
  policy_arn = aws_iam_policy.policy_2.arn
}