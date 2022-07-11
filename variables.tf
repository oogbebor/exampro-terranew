variable "key_name" {
type = string
    default     =  "newec2key"
}

variable "instance_type" {
type = string
    default     =  "t2.micro"
}

variable "security_group" {
type = string
    default     = "prvisioners_security_group"
}

variable "tag_name" {
type = string
    default     = "exampro _instance1"
}
variable "ami_id" {
type = string
    default     = "ami-0aeb7c931a5a61206"
}
