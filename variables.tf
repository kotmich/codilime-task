variable "enable_dns" {
  description = "Enable public DNS domain"
  type        = bool
  default     = false
}

variable "public_domain" {
  description = "Public domain to use for the DNS zone"
  type        = string
  default     = "example.com"
}

variable "hostname" {
  description = "Hostname for the DNS record"
  type        = string
  default     = "www.example.com"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_cidr_block" {
  description = "CIDR block for the private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}