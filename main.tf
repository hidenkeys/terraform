variable "TOKEN" {
  description = "GitHub Personal Access Token"
  type        = string
}

provider "github" {
  token = var.TOKEN  # Reference the declared variable
}

resource "github_repository" "example" {
  name        = "example-repository"
  description = "A new repository created via Terraform and GitHub Actions"
  visibility  = "public"
}
