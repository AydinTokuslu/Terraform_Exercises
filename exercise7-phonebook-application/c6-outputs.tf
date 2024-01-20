
output "dns_name" {
  description = "The DNS name of the load balancer of Phonebook."
  value       = "http://${aws_lb.terramino.dns_name}"
}
