variable "subnets" {
  type = map(object({
    cidr_block        = string
    public            = bool
    availability_zone = string  # Adding availability zone
  }))
  default = {
    "public_subnet" = {
      cidr_block        = "10.0.1.0/24"
      public            = true
      availability_zone = "us-east-1a"  # Specify the availability zone for the public subnet
    }
    "private_subnet_1" = {
      cidr_block        = "10.0.4.0/24"
      public            = false
      availability_zone = "us-east-1b"  # Specify the availability zone for the first private subnet
    }
    "private_subnet_2" = {
      cidr_block        = "10.0.3.0/24"
      public            = false
      availability_zone = "us-east-1c"  # Specify the availability zone for the second private subnet
    }
  }
}
