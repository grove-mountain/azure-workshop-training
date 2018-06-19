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

variable "vn_address_space" {
    type        = "list"
    default     = ["10.0.0.0/16"]
    description = "This is the default open network"
}

variable "vn_location" {
    type        = "string"
    default     = "East US"
    description = "This variable defines the virtual network location"
}

variable "ssh_public_key" {
    type        = "string"
    default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZS+E6KRZ9IG+X0/gKUB+9n5mSHb7INsvDYTBr2okFVICEdxEtiU2QbW617rK+AS7KG/U900V72OLAt4HJZsyJN8poozEvsUsZ+EiwPFH6UBmMR8vDXsr1JPXpiNuyz6mAeiDvSu3s/dXSi5C1qS98K36JukTVdlGi1qA+RB0ZZiUN3ClOHsRzo4nRLK5yUq5JRQgv2jEDuLcVivHJjFjB6mj1Cxfct9Tb50hhzryPkRp2LNV/HB2XtvNmbhxk1B4MpTh1adIusLEiC4njeOImY/wOoUDM+gIFkqAemCj93lBprpD7fHzVrzezXzMgCb0E0l6hymFLHl5SxknCY3jb mcbkingdom@mcballuxio.local"
    description = "The SSH public key to put in authorized keys on the target host"
}
    
