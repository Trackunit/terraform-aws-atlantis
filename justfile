# terraform-aws-atlantis
# Terraform module that runs Atlantis on AWS Fargate.
# Needs terraform, terraform-docs, tflint and prek on the PATH. No build or test
# recipe: the module has no build step and no automated tests, only the prek hooks.

# Show available commands
default:
	@just --list

# Format Terraform files the same way the terraform_fmt prek hook does
format:
	terraform fmt -recursive

# Fail when `format` would change something
format-check:
	terraform fmt -check -recursive

# Run the prek checks that never rewrite files
lint:
	prek run terraform_validate terraform_tflint check-merge-conflict --all-files
