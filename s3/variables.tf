variable "name" {
  type = string
}

variable "access" {
  type = string
  default = "private"
}

variable "versioning_status" {
  type = string
  default = "Enabled"
}

variable "organization_id" {
  type = string
}

variable "principal" {
  type = string
  default = "*"
}