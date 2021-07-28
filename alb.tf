resource "aws_lb" "alb" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_group
  subnets            = var.subnets

  enable_deletion_protection = true
  tags = var.tags
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn
   default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}

resource "aws_lb_listener_certificate" "listener_cert" {
  listener_arn    = var.listener_arn
  certificate_arn = var.certificate_arn
}

resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
  condition {
    path_pattern {
      values = var.value
    }
  }
}

resource "aws_lb_target_group" "targetgroup" {
  name     = var.name
  port     = var.targetgroup_port
  protocol = var.targetgroup_protocol
  target_type      = var.target_type
  vpc_id   = var.vpc_id
  tags     = var.targetgroup_tags
  health_check {
    healthy_threshold = var.healthy_threshold
    interval         = var.interval
    path             = var.path
    port             = var.health_check_port
    protocol         = var.health_check_protocol
    timeout          = var.timeout
    unhealthy_threshold = var.unhealthy_threshold

  }
}

resource "aws_lb_target_group_attachment" "targetgroup_attachment" {
  target_group_arn = var.target_group_arn
  target_id        = var.target_group_id
  port             = var.port
}
