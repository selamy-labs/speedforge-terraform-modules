mock_provider "helm" {}

run "rejects_max_runners_below_min_runners" {
  command = plan

  variables {
    name                 = "agents-invalid"
    namespace            = "github-runners"
    chart_version        = "0.12.1"
    github_config_url    = "https://github.com/example-org"
    github_config_secret = "github-runner-auth"
    min_runners          = 3
    max_runners          = 2
  }

  expect_failures = [
    helm_release.this,
  ]
}
