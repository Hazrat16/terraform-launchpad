# Terraform Providers

## What are Providers in Terraform?

Providers in Terraform are plugins that allow Terraform to interact with external platforms, services, or APIs.

Examples include:

- AWS
- Azure
- Google Cloud
- Kubernetes
- GitHub
- Local system resources

Providers act as the bridge between Terraform and the target platform.

---

## AWS Provider Example

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

---

## Example AWS Resource

```hcl
resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

---

## Common Providers

| Provider | Source |
|-----------|---------|
| AWS | `hashicorp/aws` |
| Azure | `hashicorp/azurerm` |
| Google Cloud | `hashicorp/google` |
| Kubernetes | `hashicorp/kubernetes` |
| GitHub | `integrations/github` |
| Local | `hashicorp/local` |

---

## Initialize Providers

Terraform downloads required providers using:

```bash
terraform init
```

---

## Local Provider

The local provider allows Terraform to manage local machine resources.

Provider source:

```hcl
hashicorp/local
```

---

## Configure Local Provider

```hcl
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}
```

---

## Create a Local File

```hcl
resource "local_file" "example" {
  filename = "hello.txt"
  content  = "Hello from Terraform"
}
```

---

## Apply Terraform Configuration

```bash
terraform apply -auto-approve
```

---

## Output

Terraform creates:

```text
hello.txt
```

With content:

```text
Hello from Terraform
```

---

## Common Local Provider Resources

- `local_file`
- `local_sensitive_file`

---

## Use Cases of Local Provider

- Generate configuration files
- Create scripts dynamically
- Store outputs locally
- Learn Terraform without cloud providers

---

## Important Notes

- Local provider only affects the machine running Terraform
- Mostly used for automation, testing, and local workflows
- Not typically used for production infrastructure

---
# Providers List

You can find all providers here: [Terraform Provider Registry](https://registry.terraform.io/browse/providers)