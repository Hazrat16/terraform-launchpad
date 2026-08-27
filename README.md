# Terraform Launchpad — AWS Demo

A classroom-friendly Terraform project that creates:

- One VPC
- One public subnet
- Internet gateway and route table
- HTTP security group
- Amazon Linux 2023 EC2 instance
- Nginx landing page
- Useful Terraform outputs

No SSH port or key pair is required for the demo.

## Prerequisites

- Terraform CLI
- AWS CLI
- An AWS account with permission to create the resources above
- AWS credentials configured through AWS CLI, environment variables, SSO, or an assumed role

Never place AWS access keys in Terraform files.

## Run

```bash
cp terraform.tfvars.example terraform.tfvars
aws sts get-caller-identity

terraform init
terraform fmt -check #checks whether your Terraform files are properly formatted, but it does not modify them.
terraform validate
terraform plan -out=tfplan
terraform apply
terraform output -raw web_url
```

### terrafor validate:
```bash 
checks things like:
Invalid Terraform syntax
Wrong argument names
Missing required arguments
Invalid references between resources/variables
Type mismatches
Whether the configuration matches the provider/resource schemas available locally
```

Open the printed URL. Initial EC2 bootstrap may take one or two minutes after `apply` completes.

## Drift detective demo

1. Open the EC2 console.
2. Change the instance's `Name` tag manually.
3. Run:

```bash
terraform plan
```

Terraform should propose restoring the tag declared in code.

Do not apply the drift correction until you have explained the plan to viewers.

## Safe cleanup

```bash
terraform plan -destroy
terraform destroy
```

Confirm that the EC2 instance, VPC, subnet, route table, gateway, and security group are removed.

## Optional remote state

`backend.tf.example` demonstrates an S3 backend with native S3 lockfile locking. Create and secure the bucket first, enable bucket versioning, replace the placeholder values, rename it to `backend.tf`, and initialize with:

```bash
terraform init -migrate-state
```

## Video experiment

Add this tag inside the provider's `default_tags` block:

```hcl
Lesson = "Declarative-Infrastructure"
```

Run `terraform plan` again. Viewers will see an in-place update rather than resource recreation.

## Cost warning

AWS resources can incur charges. Destroy the demo infrastructure immediately after recording and verify removal in the AWS console.
