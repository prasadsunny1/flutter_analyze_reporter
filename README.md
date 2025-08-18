Flutter Analyze Reporter is a parser to create reports from `flutter analyze` output.

It supports [GitLab Code Quality Widget](https://docs.gitlab.com/ee/ci/testing/code_quality.html)
format
or [GitHub Workflow messages](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions)
. Please see [example](https://pub.dev/packages/flutter_analyze_reporter/example).

## GitLab Code Quality Widget

Code quality degraded

![GitLab Merge Request Code Quality Widget](https://raw.githubusercontent.com/andnexus/flutter_analyze_reporter/main/assets/code_quality_degraded.png "GitLab Merge Request Code Quality Widget")

No Changes to code quality

![GitLab Merge Request Code Quality Widget](https://raw.githubusercontent.com/andnexus/flutter_analyze_reporter/main/assets/no_changes_to_code_quality.png "GitLab Merge Request Code Quality Widget")

## GitHub Workflow Summary

Warning, error and notice messages

![GitHub Workflow Messages](https://raw.githubusercontent.com/andnexus/flutter_analyze_reporter/main/assets/github_workflow_summary.png "GitHub Workflow Summary")

## Console output

Error, warning and info colorized

![Error, warning and info colorized](https://raw.githubusercontent.com/andnexus/flutter_analyze_reporter/main/assets/console_output.png "Error, warning and info colorized")

## GitLab CI

Parse `flutter analyze` output for [GitLab Code Quality Widget](https://docs.gitlab.com/ee/ci/testing/code_quality.html).

`.gitlab-ci.yml` file:

```
stages:
  - test
code_quality:
  stage: test
  before_script:
    - export PATH="$PATH":"$HOME/.pub-cache/bin"
  script:
    - dart pub global activate flutter_analyze_reporter_2
    - flutter_analyze_reporter --output report.json --reporter gitlab
  artifacts: 
    reports:
      codequality: report.json
```

## GitHub CI

Parse `flutter analyze` output for [GitHub Workflow messages](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions).

`.github/workflows/test.yml` file:

```
name: Test
on:
  push:
    branches:
      - main
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Analyze
        run: |
          dart pub global activate flutter_analyze_reporter_2
          flutter_analyze_reporter --reporter github
        shell: bash
```