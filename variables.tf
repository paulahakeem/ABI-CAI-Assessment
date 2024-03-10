variable "subnets" {
  type = map(object({
    cidr_block = string
  }))
  default = {
    public_subnet1 = {
      cidr_block = "10.0.0.0/24"
    }
    private_subnet1 = {
      cidr_block = "10.0.1.0/24"
    }
  }
}
