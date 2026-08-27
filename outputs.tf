output "web_url" {
  description = "Open this URL after terraform apply completes."
  value       = "http://${aws_instance.web.public_ip}"
}

output "public_ip" {
  description = "Public IPv4 address of the EC2 web server."
  value       = aws_instance.web.public_ip
}

output "instance_id" {
  description = "EC2 instance ID managed by Terraform."
  value       = aws_instance.web.id
}

output "vpc_id" {
  description = "VPC ID created by Terraform."
  value       = aws_vpc.main.id
}

output "demo_message" {
  description = "A reminder for the video demonstration."
  value       = "Change the EC2 Name tag manually in AWS, then run terraform plan to demonstrate drift detection."
}
