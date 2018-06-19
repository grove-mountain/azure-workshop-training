variable "student" {
  type        = "string"
  default     = "defaultStudent-20180619"
  description = "This variable defines the region resources will be created in"
}

variable "resource_group_location" {
    type        = "string"
    default     = "East US"
    description = "This variable defines the region resources will be created in"
}
variable "environment_tag" { 
    type        = "string" 
    default     = "Production" 
    description = "Environment Tag"
}

variable "ttl_tag" { 
    type        = "string" 
    default     = "-1" 
    description = "Time To Live in hours for tagged resources.  Do not use units.  -1 is infinite"
}

variable "owner_tag" { 
    type        = "string" 
    default     = "ops@" 
    description = "Owner of resources created."
}
