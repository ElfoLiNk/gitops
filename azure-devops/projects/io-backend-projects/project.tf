locals {
  azure_devops_org = "pagopa-io"
}

resource "azuredevops_project" "project" {
  name               = "io-backend-projects"
  description        = "This is the DevOps project for all IO backends projects"
  visibility         = "public"
  version_control    = "Git"
  work_item_template = "Basic"
}

resource "azuredevops_project_features" "project-features" {
  project_id = azuredevops_project.project.id
  features = {
    "boards"       = "disabled"
    "repositories" = "disabled"
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}
