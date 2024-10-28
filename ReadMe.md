
# GitHub Project Automation

This repository contains a set of bash scripts designed to automate the process of creating and managing GitHub Projects using the GitHub CLI (Command Line Interface). The goal is to make it easier to set up GitHub projects with custom fields and items from a pre-defined data set.

## Prerequisites

1. **GitHub CLI**: Ensure you have the GitHub CLI (`gh`) installed and authenticated.
   
   To install, follow the instructions from the [GitHub CLI documentation](https://cli.github.com/manual/).
   
   To authenticate, use:
   ```bash
   gh auth login
   ```

2. **Project ID**: You need to have a GitHub project already created and accessible. Make sure to note down the `PROJECT_ID` or project number.

3. **TSV File**: A TSV (Tab-Separated Values) file with your project data.

## Scripts Overview

### 1. `main_script.sh`

This script handles the automation of setting up a GitHub project by:
- Creating custom fields based on the first line of a TSV file.
- Creating project items based on the data in the TSV file.

#### Usage
```bash
#!/usr/bin/env bash
```

Update the following variables as needed:

- `PROJECT_NO`: The project number for your GitHub project.
- `TSV_PATH`: The file path to the TSV file with your data.

#### Execution
To run the script, use the following command:
```bash
bash main_script.sh
```

### 2. `project_seed.sh`

This file contains a sample dataset for your GitHub project in a TSV format. You can modify this file to suit your specific project needs.

## File Structure

```
.
├── main_script.sh         # Main script to automate GitHub project creation
├── project_seed.sh        # Sample project data
└── README.md              # This documentation
```

## Sample TSV File (`project_seed.sh`)

Below is the content of the `project_seed.sh` file with some sample data to get you started:

```bash
#!/usr/bin/env bash

# Sample project data in TSV format
cat <<EOF > ./github_backlog_items.tsv
Title	Status	Assignees	Size	Estimate	Linked Pull Requests	Iteration	Start Date	End Date
"Initial Setup"	"Open"	"user1"	"Medium"	"3"		"Iteration 1"	"2024-10-28"	"2024-11-05"
"Create Authentication"	"In Progress"	"user2"	"Large"	"8"		"Iteration 1"	"2024-10-29"	"2024-11-10"
"Implement Course Module"	"Open"	"user3"	"Large"	"5"		"Iteration 2"	"2024-11-01"	"2024-11-20"
"Design Instructor Dashboard"	"Backlog"	"user4"	"Small"	"2"		"Iteration 2"	"2024-11-05"	"2024-11-15"
"Deploy to Production"	"Backlog"	"user1"	"Extra Large"	"13"		"Iteration 3"	"2024-11-20"	"2024-12-01"
EOF
```

## How to Use

1. Clone the repository to your local environment:
   ```bash
   git clone https://github.com/yourusername/github-project-automation.git
   ```

2. Make sure the `gh` CLI is authenticated:
   ```bash
   gh auth login
   ```

3. Update the project number and TSV path in `main_script.sh` if needed.

4. Run the `main_script.sh` script:
   ```bash
   bash main_script.sh
   ```

## Contribution

Feel free to open issues or submit pull requests if you have improvements or suggestions!

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
