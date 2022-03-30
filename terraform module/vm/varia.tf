variable "vm_nic" {
  type    = string
  default = "nicvm"
}
variable "res_group" {
    type = string
    default = "terraform_dasan"
}
variable "res_group_loc" {
    type = string
    default = "centralindia"
}
variable "admin_username" {
  type      = string
  default   = "testadmin"
  sensitive = true
}
variable "admin_password" {
  type      = string
  default   = "Password1234!"
  sensitive = true
}
variable "nic2" {
  type = string
}

