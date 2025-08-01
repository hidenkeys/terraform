terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.6.0"  # Specify the version of the GitHub provider
    }
  }
}

# GitHub Personal Access Token (PAT) - to be passed as an environment variable
variable "TOKEN" {
  description = "GitHub Personal Access Token"
  type        = string
}

provider "github" {
  token = var.TOKEN  # Use the token from the environment variable
}

# GitHub Repository Resource
resource "github_repository" "example" {
  name        = "example-repository-v1"
  description = "A new repository created via Terraform and GitHub Actions"
  visibility  = "public"
}

# Output the URL of the created GitHub repository
output "repository_url" {
  description = "The URL of the created repository"
  value       = github_repository.example.html_url
}
