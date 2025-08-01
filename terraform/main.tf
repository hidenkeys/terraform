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

# Creating a GitHub repository with a unique name using a timestamp
resource "github_repository" "example4" {
  name        = "example-repository-v4-xxx"  # Add a timestamp to ensure uniqueness
  description = "A new repository created via Terraform and GitHub Actions"
  visibility  = "public"
}

# Output the URL of the created GitHub repository
output "repository_url" {
  description = "The URL of the created repository"
  value       = github_repository.example4.html_url
}

# Output the repository's name and description
output "repository_name" {
  description = "The name of the created repository"
  value       = github_repository.example4.name
}

output "repository_description" {
  description = "The description of the created repository"
  value       = github_repository.example4.description
}
