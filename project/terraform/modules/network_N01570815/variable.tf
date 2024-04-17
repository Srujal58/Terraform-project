variable "common_tags" {}

variable "N01570815_Rg_name" {}

variable "N01570815_Rg_location" {}

variable "N01570815_vnet" {
  type    = string
  default = "N01570815_vnet"
}

variable "N01570815_vnet_aspace" {
  default = ["10.0.0.0/16"]
}

variable "N01570815_subnet" {
  type    = string
  default = "N01570815_subnet"
}

variable "nsg" {
  type    = string
  default = "N01570815_nsg"
}

variable "N01570815_subnet_aspace" {
  default = ["10.0.0.0/24"]
}
