variable "locations" {
  type        = string
  description = "location name of resource"
  default     = "westus2"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the resources will be created."
  default     = "group_az"
}

variable "virtual_network_name" {
  type    = string
  default = "virtual_az"
}

variable "subnet_name" {
  type        = string
  description = "The subnet id of the virtual network where the virtual machines will reside."
  default     = "internal"
}

variable "subnet_ip" {
  default     = ["10.0.0.0/16"]
  description = "this is subnet ip adress"
}

variable "interface_name" {
  type    = string
  default = "azure_interface"
}

variable "ip_configuration" {
  type    = string
  default = "ip_name"
}

variable "private_ip_address_allocation" {
  type        = string
  description = " Defines how an IP address is assigned. Options are Static or Dynamic."
  default     = "Dynamic"
}

variable "ip_add" {
  type    = any
  default = ["10.0.0.0/16"]
}

variable "vm_name" {
  type    = string
  default = "virtualmachine"
}

variable "sizes" {
  type        = string
  description = "Data Disk Storage Account type."
  default     = "Standard_F2"
}


variable "public_key" {
    type = any
    description = ": Path to the public key to be used for ssh access to the VM. Only used with non-Windows vms and can be left as-is even if using Windows vms. If specifying a path to a certification on a Windows machine to provision a linux vm use the / in the path versus backslash.e.g. c : /home/id_rsa.pub."
    default = "~/.ssh/id_rsa.pub"
   
}

variable "publisher" {
  type        = string
  description = " Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "Canonical"
}

variable "offer" {
  type        = any
  description = " Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "0001-com-ubuntu-server-focal"
}

variable "sku" {
  type        = any
  description = "Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "20_04-lts"
}

variable "versions" {
  type        = string
  description = "pecifies the version of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "latest"
}
variable "admin_username" {
  type        = string
  description = " The admin username of the VM that will be deployed."
  default     = "adminuser"
}

variable "caching" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  default     = "ReadWrite"
}

variable "storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created."
  default     = "Standard_LRS"

}
