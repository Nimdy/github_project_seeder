#!/usr/bin/env bash

# Ensure GitHub CLI is installed and authenticated
# Login with `gh auth login`

# Function to create fields in the project
function create_fields() {
  echo "Creating project's fields..."
  
  # Read the first row (header) and treat the entire field names correctly, including multi-word names
  IFS=$'\t' read -r -a fields <<< "$(head -n1 "$2")"
  
  existing_fields=$(gh project field-list $1 --owner "CHANGEME" --format json --jq '.[].name')  # Get existing fields and Update the owner to the owner of the Repo

  for field in "${fields[@]}"; do
    if echo "$existing_fields" | grep -q "$field"; then
      echo "Field '$field' already exists, skipping..."
    else
      echo "Creating field: $field"
      gh project field-create $1 --owner "akyladellc" --name "$field" --data-type TEXT
    fi
  done
}

# Function to create items in the project
function create_items() {
  echo "Creating project items..."
  
  # Read the entire title (1st column) as a whole string from the TSV
  while IFS=$'\t' read -r title status assignees size estimate linked_pull_requests iteration start_date end_date; do
    if [ -z "$title" ]; then
      continue  # Skip empty lines
    fi
    echo "Creating item: $title"
    gh project item-create $1 --owner "CHANGEME" --title "$title"  #Update the owner to the owner of the Repo
  done < <(tail -n +2 "$2")
}

# Static values
PROJECT_NO=1  # Update this to match your project number
TSV_PATH=./github_backlog_items.tsv  # Update this to match the actual location of your TSV file

# Execute functions
create_fields $PROJECT_NO $TSV_PATH
create_items $PROJECT_NO $TSV_PATH
