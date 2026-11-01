module "rg" {
  source = "../../Modules/RG"
  var-rg = var.rg
}


module "vnet" {
  depends_on = [ module.rg ]
  source = "../../Modules/VNET"
  var-vnet = var.vnet
}

module "subnet" {
  depends_on = [ module.rg, module.vnet ]
  source = "../../Modules/SUBNET"
  var-subnet = var.subnet
}

module "pubip" {
  depends_on = [ module.rg ]
  source = "../../Modules/PUBLIC_IP"
  var-pubip = var.pubip
}

module "bastion" {
  depends_on = [ module.rg , module.subnet , module.pubip ]
  source = "../../Modules/BASTION"
  var-bastion = var.bastion
}
