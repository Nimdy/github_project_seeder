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
