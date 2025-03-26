**Ticket Type:** Task  
**Title:** For Each  
**Project:** Version Control System Deployment  
**Assignee:** You  
**Reporter:** Derek Morgan  
**Priority:** High  
**Labels:** Terraform, GitHub, Locals  
**Epic Link:** GitHub Expansion  
**Sprint:** Sprint 01/for\_each

**Description:**

The team needs to be able to deploy multiple repositories dynamically. Each repository also needs a staging branch attached to it. All attributes for these resources must be defined within a `locals.tf` file. The `main.tf` file should only have a single resource defined for the repositories and one for the branches. If you were to hardcode everything, it would look like this: 

```
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

```

**Acceptance Criteria:**

> **Note:** If the `terraform validate` command fails, all tasks in the lab will fail!

1\. Create a `locals.tf` file with the necessary `locals` data structure to store the needed information.   
2\. Create the GitHub repository resource and reference the items in the data structure as needed.   
3\. Create the GitHub branch and reference the items in the data structure as needed.   
4\. Use `for_each` to create all necessary resources defined in `locals.tf` while only defining each resource once in `main.tf`  
5\. The `locals` block should have a `repos` map that contains the repository information.   
6.Within the `repos` map, there should be the repo names, `infra-dev` and `infra-prod`  
7\. Each repo name should have a nested map for the rest of the information. You will need the `description`, `auto_init`, `visibility`, `gitignore_template`, and `branch_name` information in each map. 

**Implementation Notes:**

Feel free to use code from previous labs. The values aren’t as important as the concepts. Remember, don’t use a `name` attribute in the locals block. Instead, each repository should have the name of the repository set as the key that represents that collection of repository information. 

- <a href="https://registry.terraform.io/providers/integrations/github/latest/docs" target="_blank">GitHub Provider Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/values/locals" target="_blank">Local Values Guide</a>  
- <a href="https://developer.hashicorp.com/terraform/language/meta-arguments/for_each" target="_blank">for_each Meta-Argument</a>

