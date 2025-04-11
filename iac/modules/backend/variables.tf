
variable "bucket_name" {
  description = "Nombre del bucket de S3 para el estado remoto de Terraform"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla de DynamoDB para locks"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev, prod, etc)"
  type        = string
  default     = "dev"
}
