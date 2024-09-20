output "rds_instance_endpoint" {
  value       = aws_db_instance.myrds.endpoint
}

output "rds_instance_arn" {
  value       = aws_db_instance.myrds.arn
}

output "rds_instance_status" {
  value       = aws_db_instance.myrds.status
}
output "instance_id" {
  value       = aws_instance.Mywebserver.id
}

output "instance_public_ip" {
  value       = aws_instance.Mywebserver.public_ip
}

output "instance_private_ip" {
  value       = aws_instance.Mywebserver.private_ip
}
