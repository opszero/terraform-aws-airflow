<!-- BEGIN_TF_DOCS -->
# Airflow

AWS Managed Airflow
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Airflow | `any` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group ids | `any` | n/a | yes |
| <a name="input_subnets_ids"></a> [subnets\_ids](#input\_subnets\_ids) | Private subnet ids | `any` | n/a | yes |
## Resources

| Name | Type |
|------|------|
| [aws_mwaa_environment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mwaa_environment) | resource |
## Outputs

No outputs.
<!-- END_TF_DOCS -->