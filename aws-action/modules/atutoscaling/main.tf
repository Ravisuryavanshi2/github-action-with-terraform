resource "aws_launch_template" "launch_template" {
  name_prefix   = "hello-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id
  }

  lifecycle {
    create_before_destroy = true
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }

  tags = {
    Name = "hello-launch-template"
  }
}

resource "aws_autoscaling_group" "autoscaling_group" {
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
  vpc_zone_identifier  = [var.subnet_id]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true
  wait_for_capacity_timeout = "0"

  tag {
    key                 = "Name"
    value               = "hello-asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "target_tracking_cpu" {
  name                   = "TargetTrackingScalingPolicy"
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
  policy_type            = "TargetTrackingScaling"

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}
