resource "aws_cloudwatch_metric_alarm" "ec2_cpu_alarm" {
  alarm_name          = "EC2HighCPUAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"  # Period to evaluate the metric (in seconds)
  statistic           = "Average"
  threshold           = "80"   # Set CPU usage threshold to 80%
  
  dimensions = {
    InstanceId = aws_instance.jenkins.id
  }

  alarm_actions = [aws_sns_topic.sns_topic.arn]  # Add SNS topic for notifications
}

# Optional: Create SNS Topic for Alarm Notifications
resource "aws_sns_topic" "sns_topic" {
  name = "cpu_alarm_notifications"
}

resource "aws_sns_topic_subscription" "email_notifications" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = "your-email@example.com"  # Replace with your email address
}
