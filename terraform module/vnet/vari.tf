variable "vnet_name" {
  type    = string
  default = "terraform_vnet1"
}
variable "res_group" {
    type = string
    default = "terraform_dasan"
}
variable "res_group_loc" {
    type = string
    default = "centralindia"
}
variable "subnetv" {
    type = string
    default = "terraform-subnet"
}
variable "pupip" {
    type = string
    default = "TestPublicIp1"
}
variable "vm_nic" {
  type    = string
  default = "nicvm"
}