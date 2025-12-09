variable "project" {

  description = "Project name prefix"

  type        = string

  default     = "foundation"

}
 
variable "vpc_cidr" {

  description = "CIDR block for VPC"

  type        = string

  default     = "10.0.0.0/16"

}
 
variable "public_subnet_cidrs" {

  description = "Public subnet CIDRs"

  type        = list(string)

  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}
 
variable "private_subnet_cidrs" {

  description = "Private subnet CIDRs"

  type        = list(string)

  default     = ["10.0.3.0/24", "10.0.4.0/24"]

}
 
variable "azs" {

  description = "Availability Zones"

  type= list(string)

  default= ["ap-south-1a", "ap-south-1b"]

}

 