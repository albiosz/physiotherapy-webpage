terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
      configuration_aliases = [
        aws.eu_central_1,
        aws.us_east_1
      ]
    }
  }
}
