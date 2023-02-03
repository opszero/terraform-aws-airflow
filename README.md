<!-- BEGIN_TF_DOCS -->
# Airflow

AWS Managed Airflow

Notes: Do not use [AWS Managed Workflows for Apache
Airflow](https://aws.amazon.com/managed-workflows-for-apache-airflow/) it is
both expensive and finicky. Check out
[airbase](https://github.com/opszero/airbase) instead to install AIrflow
on Kubernetes.
# Pro Support

<a href="https://www.opszero.com"><img src="http://assets.opszero.com.s3.amazonaws.com/images/opszero_11_29_2016.png" width="300px"/></a>

[opsZero provides additional support](https://www.opszero.com/terraform) for our modules including:

- Email support
- Zoom Calls
- Implementation Guidance
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The bucket name for the dags. If not specified a `<name>-airflow` bucket is created | `string` | `""` | no |
| <a name="input_dags_path"></a> [dags\_path](#input\_dags\_path) | The place for dags, requirements.txt, etc. | `string` | `"dags/"` | no |
| <a name="input_environment_class"></a> [environment\_class](#input\_environment\_class) | Environment class for the cluster | `string` | `""` | no |
| <a name="input_iam_policy_arns"></a> [iam\_policy\_arns](#input\_iam\_policy\_arns) | The policy arns that are added to the role attached to Airflow | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Airflow | `any` | n/a | yes |
| <a name="input_plugins_s3_path"></a> [plugins\_s3\_path](#input\_plugins\_s3\_path) | The relative path to the plugins.zip file on your Amazon S3 storage bucket | `string` | `""` | no |
| <a name="input_requirements_s3_path"></a> [requirements\_s3\_path](#input\_requirements\_s3\_path) | The relative path to the requirements.txt file on your Amazon S3 storage bucket | `string` | `""` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group ids | `any` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Private subnet ids | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to resources | `map` | `{}` | no |
## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_mwaa_environment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mwaa_environment) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
## Outputs

No outputs.
<!-- END_TF_DOCS -->