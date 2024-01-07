#!/bin/bash

##############################
### About This Script:
# Purpose: It's like a detective that peeks into a GitHub repository to find out who has "read" access, meaning those who can view and download its contents.
# Key Tools: It uses the GitHub API to reach into the repository's information and curl to make the request.
# Special Language: It speaks a language called Bash, common in the world of computers to automate tasks.

### Input:
# Repository Details: Start by telling the script the name of the GitHub user who owns the repository (like their username) and the repository's name. Think of it like giving it an address to visit.
# Secret Credentials: It'll need your GitHub username and a personal access token, which is like a special key to unlock the API's doors. Keep these safe!

### Ownership:
# Belonging: The script itself belongs to you, the person running it. You're in charge!
# Authorship: Someone else wrote the original code, but you can customize it to fit your needs.

helper()

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

function helper{
 expected_cmd_args=2
 if [ $# -ne $expected_cmd_args]; then
  echo "Please execute the script with required cmd args"
  echo "asd"
 } 
  # Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
