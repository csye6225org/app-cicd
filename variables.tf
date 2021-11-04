variable "aws_iam_user" {
  type        = string
  description = "User for generating ami"
}
variable "aws_codedeploy_bucket" {
  type        = string
  description = "AWS S3 Bucket for code deploy"
}
variable "aws_region" {
  type        = string
  description = "AWS region"
}
variable "aws_account_id" {
  type        = string
  description = "AWS account id"
}
variable "aws_codedeploy_application_name" {
  type        = string
  description = "AWS codedeploy application name"
}