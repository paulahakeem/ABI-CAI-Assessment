output "public_subnet_id" {
  value = aws_subnet.subnet["public_subnet"].id
}

output "private_subnet_id1" {
  value = aws_subnet.subnet["private_subnet_1"].id
}

output "private_subnet_id2" {
  value = aws_subnet.subnet["private_subnet_2"].id
}


output "secgroup-id" {
value = aws_security_group.secgroup.id    
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.db.name
}
