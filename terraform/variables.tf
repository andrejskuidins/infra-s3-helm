variable "tags" {
  description = "Map of tags to be assigned to AWS resources."
  type = object({
    region      = string
    environment = string
    solution    = string
    component   = string
  })
}
