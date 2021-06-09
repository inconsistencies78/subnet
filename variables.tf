variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "resource_group_location" {
  type        = string
  default     = "germanywestcentral"
  description = "Location of resource"
}

variable "tags" {
  type = map(any)
  default = {
    author = "andreas.barthel"
  }
  description = "Tag for author"
}