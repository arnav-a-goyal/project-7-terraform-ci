# Project 7: CI Validation for Terraform

[![Terraform CI Validation](https://github.com/arnav-a-goyal/project-7-terraform-ci/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/arnav-a-goyal/project-7-terraform-ci/actions/workflows/terraform.yml)

Goal: Run `terraform fmt` and `terraform validate` automatically on every push.

This workflow validates configuration only. It does not run `terraform plan` or
`terraform apply`, does not need AWS credentials, and does not create AWS
resources.

## 1. Install the prerequisites

Open a new PowerShell terminal and run:

```powershell
winget --version
```

Install Git, Terraform, and Visual Studio Code if any command below is missing:

```powershell
winget install --id Git.Git -e
winget install --id Hashicorp.Terraform -e
winget install --id Microsoft.VisualStudioCode -e
```

Close and reopen VS Code after installation. Then confirm the tools:

```powershell
git --version
terraform version
code --version
```

In VS Code, install these extensions:

1. Open Extensions with `Ctrl+Shift+X`.
2. Search for `HashiCorp Terraform` and click **Install**.
3. Search for `GitHub Actions` and click **Install**.

## 2. Open Project 7

In VS Code, select **File > Open Folder**, then open the `project_7` folder.
Open **Terminal > New Terminal**. The terminal path must end in `project_7`.

## 3. Check the files locally

Run each command:

```powershell
terraform fmt -recursive
terraform init -backend=false
terraform validate
```

Expected validation result:

```text
Success! The configuration is valid.
```

If the format command changes a file, keep that change.

The following CI workflow is already included:

```text
.github/workflows/terraform.yml
```

It runs on every push and pull request to `main` and performs:

1. Repository checkout
2. Terraform setup
3. `terraform fmt -check -recursive`
4. `terraform init -backend=false -input=false`
5. `terraform validate`

## 4. Confirm formatting locally

Before publishing, confirm that formatting checks work:

```powershell
terraform fmt -check -recursive
```

A clean exit with no error means formatting is correct.

## 5. Create the GitHub repository

1. Open https://github.com and sign in.
2. Select **New repository**.
3. Name it `project-7-terraform-ci`.
4. Keep it **Public** or set it to **Private** as required by your assessment.
5. Do not add a README, `.gitignore`, or license because these files already
   exist locally.
6. Select **Create repository**.

## 6. Push the project from the VS Code terminal

Run these commands one at a time:

```powershell
git init
git add .
git commit -m "Add Terraform CI validation"
git branch -M main
git remote add origin https://github.com/arnav-a-goyal/project-7-terraform-ci.git
git push -u origin main
```

If Git asks for identity, run the following with your details, then repeat the
commit:

```powershell
git config --global user.name "YOUR-NAME"
git config --global user.email "YOUR-GITHUB-EMAIL"
```

If GitHub asks for sign-in, use the browser/device-code prompt. Do not put a
token or password in a source file.

## 7. Confirm the pipeline

1. Open the GitHub repository.
2. Select the **Actions** tab.
3. Select **Terraform CI Validation**.
4. Confirm the latest run has a green check.
5. Open the run and confirm these steps succeeded:
   - Check Terraform formatting
   - Initialize Terraform
   - Validate Terraform

## 8. Add the workflow badge

The workflow badge is already included at the top of this README. If you use a
different GitHub username or repository name, replace `arnav-a-goyal` or
`project-7-terraform-ci` in this line:

```markdown
[![Terraform CI Validation](https://github.com/arnav-a-goyal/project-7-terraform-ci/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/arnav-a-goyal/project-7-terraform-ci/actions/workflows/terraform.yml)
```

Commit and push the README update:

```powershell
git add README.md
git commit -m "Add Terraform CI workflow badge"
git push
```

Refresh the repository page. The badge must show **passing**.

## 9. Capture the required evidence

Create an `evidence` folder and save a screenshot showing:

1. The GitHub Actions run with a green success status.
2. The completed `Check Terraform formatting` and `Validate Terraform` steps.
3. The workflow badge showing **passing** on the repository page.

Useful screenshot names:

```text
evidence\terraform-pipeline-success.png
evidence\terraform-validation-steps.png
evidence\workflow-badge.png
```

## Project 7 deliverables

- GitHub repository URL
- Pipeline success screenshot
- Workflow badge in the repository README

## No AWS setup is required

Do not run `terraform apply` for this project. The GitHub Actions workflow uses
`terraform init -backend=false` and `terraform validate`, so AWS credentials and
an AWS login are not required.
