#!/usr/bin/env python3
"""
GitHub API Example

This script fetches repositories for a given GitHub user using the GitHub API.
"""

import requests
import os

def fetch_repositories(username):
    """Fetch repositories for a GitHub user."""
    url = f"https://api.github.com/users/{username}/repos"
    response = requests.get(url)
    
    if response.status_code == 200:
        repos = response.json()
        for repo in repos:
            print(f"- {repo['name']}")
    else:
        print(f"Failed to fetch repositories: {response.status_code}")


if __name__ == "__main__":
    username = "MalavyaRaval"
    print(f"Fetching repositories for {username}...")
    fetch_repositories(username)