variable "domain_name" {
  type = string
}

variable "acm_certificate_domain_validation_options" {
  type = list(object({
    domain_name           = string
    resource_record_name  = string
    resource_record_value = string
    resource_record_type  = string
  }))
}
variable "acm_certificate_arn" {
  type = string
}

