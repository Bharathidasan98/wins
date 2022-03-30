module "RG" {
  source = "./RGM"
}
module "vnetm" {
  source = "./vnet"
}

module "RG-vm" {
  source = "./vm"
  nic2   = module.vnetm.nic_id
  depends_on = [
    module.vnetm
  ]
}
