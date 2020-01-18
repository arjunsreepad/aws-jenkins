// Output
output "jenkinsurl" {
  value = aws_route53_record.jenkins_master.name
}
output "efs" {
  value = aws_efs_file_system.master
}
