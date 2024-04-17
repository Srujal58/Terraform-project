module "rgroup_N01570815" {
  source = "./modules/rgroup_N01570815"

  N01570815_Rg       = "N01570815_Rg"
  N01570815_location = "UK West"
  common_tags        = local.common_tags
}

module "network_N01570815" {
  source                = "./modules/network_N01570815"
  N01570815_Rg_location = module.rgroup_N01570815.N01570815_Rg_location
  N01570815_Rg_name     = module.rgroup_N01570815.N01570815_Rg_name
  common_tags           = local.common_tags
}

module "common_N01570815" {
  source                = "./modules/common_N01570815"
  N01570815_Rg_location = module.rgroup_N01570815.N01570815_Rg_location
  N01570815_Rg_name     = module.rgroup_N01570815.N01570815_Rg_name
  common_tags           = local.common_tags
}

module "vmlinux_N01570815" {
  source                = "./modules/vmlinux_N01570815"
  N01570815_Rg_location = module.rgroup_N01570815.N01570815_Rg_location
  N01570815_Rg_name     = module.rgroup_N01570815.N01570815_Rg_name
  subnet_id             = module.network_N01570815.subnet_id
  storage_account_uri   = module.common_N01570815.storage_account-primary_blob_endpoint
  common_tags           = local.common_tags
}

module "vmwindows_N01570815" {
  source                = "./modules/vmwindows_N01570815"
  N01570815_Rg_location = module.rgroup_N01570815.N01570815_Rg_location
  N01570815_Rg_name     = module.rgroup_N01570815.N01570815_Rg_name
  subnet_id             = module.network_N01570815.subnet_id
  storage_account_uri   = module.common_N01570815.storage_account-primary_blob_endpoint
  common_tags           = local.common_tags
}

module "datadisk_N01570815" {
  source                = "./modules/datadisk_N01570815"
  N01570815_Rg_location = module.rgroup_N01570815.N01570815_Rg_location
  N01570815_Rg_name     = module.rgroup_N01570815.N01570815_Rg_name
  vm_linux_ids          = module.vmlinux_N01570815.vm-linux.ids
  vm_windows_ids        = module.vmwindows_N01570815.windows.ids
  all_vms_ids           = concat(module.vmlinux_N01570815.vm-linux.ids, module.vmwindows_N01570815.windows.ids)
  common_tags           = local.common_tags
}

module "loadbalancer_N01570815" {
  source                = "./modules/loadbalancer_N01570815"
  N01570815_Rg_location = module.rgroup_N01570815.N01570815_Rg_location
  N01570815_Rg_name     = module.rgroup_N01570815.N01570815_Rg_name
  linux_vm_nic_ids      = module.vmlinux_N01570815.vm-linux.nic-ids
  linux_vm_name         = module.vmlinux_N01570815.vm-linux.hostnames
  common_tags           = local.common_tags
}

module "database_N01570815" {
  source                = "./modules/database_N01570815"
  N01570815_Rg_location = module.rgroup_N01570815.N01570815_Rg_location
  N01570815_Rg_name     = module.rgroup_N01570815.N01570815_Rg_name
  common_tags           = local.common_tags
}

locals {
  common_tags = {
    Assignment : "CCGC 5502 Automation Assignment"
    Name : "Srujal.Shah"
    ExpirationDate : "2024-12-31"
    Environment : "Learning"
  }
}
