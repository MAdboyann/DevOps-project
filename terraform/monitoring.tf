resource "aws_sns_topic" "alerts" {
    name = "app-alerts"
}
resource "aws_sns_topic_subscription" "alerts_email" {
    topic_arn = aws_sns_topic.alerts.arn
    protocol  = "email"
    endpoint  = "mpataria2@gmail.com"
}
resource "aws_cloudwatch_metric_alarm" "ec2_high_cpu" {
    alarm_name          = "ec2_high_cpu_utilization"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 2
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = 60
    statistic           = "Average"
    threshold           = 80
    alarm_description   = "This metric monitors EC2 instance CPU utilization."
    alarm_actions       = [aws_sns_topic.alerts.arn]
    dimensions = {
        InstanceId = aws_instance.company_ec2.id
    }
}
resource "aws_cloudwatch_metric_alarm" "rds_connections_high" {
    alarm_name          = "rds_high_db_connections"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 2
    metric_name         = "DatabaseConnections"
    namespace           = "AWS/RDS"
    period              = 60
    statistic           = "Average"
    threshold           = 100
    alarm_description   = "This metric monitors RDS database connections."
    alarm_actions       = [aws_sns_topic.alerts.arn]
    dimensions = {
        DBInstanceIdentifier = aws_db_instance.postgres_db.id
    }
}