resource "github_repository" "infra-dev" {
  name               = "infra-dev"
  description        = "Infrastructure Dev Repository"
  auto_init          =  true
  visibility         = "private"
  gitignore_template = "Terraform"
}

resource "github_branch" "infra-dev-staging" {
  repository = github_repository.infra-dev.name
  branch     = "staging"
}

resource "github_repository" "infra-prod" {
  name               = "infra-prod"
  description        = "Infrastructure Prod Repository"
  auto_init          =  true
  visibility         = "public"
  gitignore_template = "Terraform"
}

resource "github_branch" "infra-prod-staging" {
  repository = github_repository.infra-prod.name
  branch     = "staging"
}

