variable "aws_region" {
  type = string
}

variable "aws_access_key" {
  type      = string
  ephemeral = true
}

variable "aws_secret_key" {
  type      = string
  ephemeral = true
}


variable "domain_name" {
  type = string
}

variable "bucket_name" {
  type = string
}
