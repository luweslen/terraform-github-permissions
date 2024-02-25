terraform {
  cloud {
    organization = "example-org-f6c6aa"

    workspaces {
      name = "coffe-with-devops"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  owner = "luweslen"
  token = "${var.GITHUB_TOKEN}"
}

resource "github_repository" "coffee-com-devops" {
  name = "coffee-com-devops"
}

resource "github_branch_protection_v3" "coffee-com-devops" {
  repository     = github_repository.coffee-com-devops.name
  branch         = "main"
  enforce_admins = true
}