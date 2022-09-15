resource "aws_mwaa_environment" "this" {
  name = var.name

#   network_configuration {
#     security_group_ids = [aws_security_group.example.id]
#     subnet_ids         = aws_subnet.private[*].id
#   }

#   source_bucket_arn = aws_s3_bucket.example.arn

#   dag_s3_path        = "dags/"
#   execution_role_arn = aws_iam_role.example.arn

#   logging_configuration {
#     dag_processing_logs {
#       enabled   = true
#       log_level = "DEBUG"
#     }

#     scheduler_logs {
#       enabled   = true
#       log_level = "INFO"
#     }

#     task_logs {
#       enabled   = true
#       log_level = "WARNING"
#     }

#     webserver_logs {
#       enabled   = true
#       log_level = "ERROR"
#     }

#     worker_logs {
#       enabled   = true
#       log_level = "CRITICAL"
#     }
#   }
}
