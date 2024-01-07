# Shell-Scripting
## This script as a detective who's checking a GitHub repository to see who has "read" access, meaning who can view and download its stuff.

## Here's how it goes about its investigation:

# 1. Declares Its Language:
- It starts by saying "#!/bin/bash" to let everyone know it's speaking Bash, a common language for automating tasks.
  
# 2. Calls a Helper:
- It immediately calls a "helper" function, which we'll explain later.
  
# 3. Sets Up Communication:
- It stores the address of the GitHub API in a variable called "API_URL" (https://api.github.com), like storing a phone number.

# 4. Prepares Identification:
- It grabs your GitHub username and personal access token (like a special password) and puts them in variables for later use, keeping them secret.

# 5. Awaits Instructions:
- It waits for you to give it the name of the GitHub user who owns the repository (like their username) and the repository's name, as if you're pointing it to a specific address.

# 6. Makes API Calls:
- It has a handy function called "github_api_get" that can make calls to the GitHub API (like making phone calls). It takes a specific "endpoint" (like a specific department) as input and constructs the full URL to make the request.

# 7. Finds Collaborators:
- It has another function called "list_users_with_read_access" that focuses on finding collaborators with "read" access. It uses "github_api_get" to fetch a list of collaborators and then filters out those who don't have "pull" access (meaning they can't download).

# 8. Reports Findings:
- It either says "No users with read access found" or lists the usernames of those who do have access.
  
## Now, let's dive into the helper function:

# Helper Function:
-It's like a gatekeeper, making sure the script has the right information to do its job.
- It expects exactly two command-line arguments (the repository owner and name).
- If those arguments are missing, it politely reminds you to provide them.
- That's the script's detective work in a nutshell!
