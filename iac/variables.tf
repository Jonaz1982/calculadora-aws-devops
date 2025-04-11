
variable "region" {
  default = "us-east-1"
}

variable "s3_bucket" {
  description = "Nombre del bucket S3 para el backend remoto"
}

variable "s3_dynamodb_table" {
  description = "Nombre de la tabla DynamoDB para el locking"
}

variable "environment" {
  default = "dev"
}
