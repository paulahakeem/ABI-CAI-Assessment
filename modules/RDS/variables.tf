variable "allocated_storage" {
  type        = number
}

variable "instance_class" {
  type        = string
}

variable "db_name" {
  type        = string
}

variable "username" {
  type        = string
}

variable "password" {
  type        = string
}

#variable "db_subnet_group_name" {
#  type        = string
#}

variable "publicly_accessible" {
}

variable "engine" {
  type        = string
}

variable "engine_version" {
  type        = string
}
