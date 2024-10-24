resource "aws_cloudwatch_metric_alarm" "eks_node_memory_alarm" {
  alarm_name          = "EKSNodeHighMemoryAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "ContainerInsights"
  period              = "120"
  statistic           = "Average"
  threshold           = "75"   # Set memory usage threshold to 75%

  dimensions = {
    ClusterName = "local.name"  
  }

  alarm_actions = [aws_sns_topic.sns_topic.arn]  # Use the same SNS topic for notifications
}
