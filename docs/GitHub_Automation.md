# GitHub Automation

This document outlines how to automate GitHub tasks using the GitHub CLI (`gh`) and API.

## GitHub CLI (`gh`)

### Installation
```bash
sudo apt-get install gh -y
gh auth login
```

### Common Commands
```bash
# Create a repository
gh repo create MalavyaRaval/<repo-name> --public --push --source=.

# List repositories
gh repo list MalavyaRaval

# Clone a repository
gh repo clone MalavyaRaval/<repo-name>

# Create a pull request
gh pr create --title "Feature: Add new script" --body "Description of changes" --base main --head feature-branch
```

## GitHub API

### Python Example
See [scripts/github_api_example.py](../scripts/github_api_example.py) for a Python script to fetch repositories using the GitHub API.

### API Authentication
Use a **Personal Access Token (PAT)** for authentication:
```bash
export GITHUB_TOKEN="your_github_token_here"