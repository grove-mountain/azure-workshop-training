variable "resource_group_name" {
  default = "myResourceGroup"
}

variable "resource_group_location" {
    type = "string"
    default = "East US"
    description = "This variable defines the region resources will be created in"
}
variable "environment_tag" { 
    type = "string" 
    default = "Production" 
    description = "Environment Tag"
}

