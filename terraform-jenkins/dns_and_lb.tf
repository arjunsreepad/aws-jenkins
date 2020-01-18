# 2 Load balances are exposed one on http and another on https on jenkins.arjunsreepad.com

resource "aws_lb" "master" {
  name                       = "jenkins-master"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = var.public_subnet_ids
  enable_deletion_protection = false
  tags                       = var.resources_tags
}

resource "aws_lb_listener" "master" {
  load_balancer_arn = aws_lb.master.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.master.arn
  }
}

resource "aws_lb_listener" "master_https" {
  load_balancer_arn = aws_lb.master.arn
  port              = "443"
  protocol          = "TLS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:369337347074:certificate/c91be853-10bd-42c5-a23b-7f56300dae52"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.master.arn
  }
}  

resource "aws_lb_target_group" "master" {
  name_prefix = "jm"
  port        = 8080
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route53_record" "jenkins_master" {
  zone_id = "Z2PL9JJOXXV5V3"
  name    = "jenkins.arjunsreepad.com"
  type    = "A"

  alias {
    name                   = aws_lb.master.dns_name
    zone_id                = aws_lb.master.zone_id
    evaluate_target_health = true
  }
}
