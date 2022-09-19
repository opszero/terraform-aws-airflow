variable "name" {
  description = "Name of the Airflow"
}

variable "security_group_ids" {
  description = "Security group ids"
}

variable "subnet_ids" {
  description = "Private subnet ids"
}

variable "bucket_name" {
  description = "The bucket name for the dags. If not specified a `<name>-airflow` bucket is created"
  default     = ""
}

variable "iam_policy_arns" {
  description = "The policy arns that are added to the role attached to Airflow"
  default     = []
}

variable "dags_path" {
  description = "The place for dags, requirements.txt, etc."
  default     = "dags/"
}

variable "tags" {
  description = "Tags to add to resources"
  default     = {}
}

variable "plugins_s3_path" {
  description = "The relative path to the plugins.zip file on your Amazon S3 storage bucket"
  default     = ""
}

variable "environment_class" {
  description = "Environment class for the cluster"
  default     = ""
}
