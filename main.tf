data "aws_region" "current" {}
data "aws_caller_identity" "current" {}


locals {
  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_mwaa_environment" "this" {
  name = var.name
  #environment_class =

  execution_role_arn = aws_iam_role.this.arn

  network_configuration {
    security_group_ids = var.security_group_ids
    subnet_ids         = var.subnet_ids
  }

  source_bucket_arn    = aws_s3_bucket.this.arn
  dag_s3_path          = var.dags_path
  requirements_s3_path = var.requirements_s3_path
  # plugins_s3_path

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

  tags = local.tags

  depends_on = [
    aws_iam_role.this,
    aws_iam_role_policy.this,
    aws_iam_role_policy_attachment.this,
    aws_s3_bucket_public_access_block.this,
  ]
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name != "" ? var.bucket_name : "${var.name}-airflow"
  tags   = local.tags
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_iam_role" "this" {
  name               = "${var.name}-airflow"
  assume_role_policy = data.aws_iam_policy_document.assume.json
  tags               = local.tags
}

data "aws_iam_policy_document" "assume" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      identifiers = [
        "airflow-env.amazonaws.com",
        "airflow.amazonaws.com"
      ]
      type = "Service"
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.iam_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = var.iam_policy_arns[count.index]
}

resource "aws_iam_role_policy" "this" {
  name   = "${var.name}-airflow-execution-base"
  policy = data.aws_iam_policy_document.this.json
  role   = aws_iam_role.this.id
}

data "aws_iam_policy_document" "this" {
  source_policy_documents = [
    data.aws_iam_policy_document.base.json,
  ]
}

data "aws_iam_policy_document" "base" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "airflow:PublishMetrics"
    ]
    resources = [
      "arn:aws:airflow:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:environment/${var.name}"
    ]
  }
  statement {
    effect  = "Deny"
    actions = ["s3:ListAllMyBuckets"]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject*",
      "s3:GetBucket*",
      "s3:List*"
    ]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetAccountPublicAccessBlock"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:GetLogRecord",
      "logs:GetLogGroupFields",
      "logs:GetQueryResults"
    ]
    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:airflow-${var.name}-*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:DescribeLogGroups"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:PutMetricData"
    ]
    resources = [
      "*"
    ]
  }
}
