variable "aws_iam_user" {
  type        = string
  description = "User for generating ami"
}
variable "aws_codedeploy_bucket" {
  type        = string
  description = "AWS S3 Bucket for code deploy"
}