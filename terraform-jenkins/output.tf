# This outputs the jenkins utl
output "jenkinsurl" {
  value = aws_route53_record.jenkins_master.name
}
