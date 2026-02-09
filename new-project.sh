#!/bin/bash
# new-project.sh — Scaffold a new project from the AI PM Builder's Template
# Usage: ./new-project.sh <project-name>
#
# Author: Jerome Davis
# Part of: AI PM Builder's Template

set -e

# Validate input
if [ -z "$1" ]; then
    echo "Usage: ./new-project.sh <project-name>"
    echo "Example: ./new-project.sh risk-dashboard"
    exit 1
fi

PROJECT_NAME="$1"
PROJECT_DIR="projects/$PROJECT_NAME"
TEMPLATE_DIR="projects/.project-template"

# Check if project already exists
if [ -d "$PROJECT_DIR" ]; then
    echo "Error: Project '$PROJECT_NAME' already exists at $PROJECT_DIR"
    exit 1
fi

# Check if template exists
if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Error: Project template not found at $TEMPLATE_DIR"
    exit 1
fi

echo "Creating new project: $PROJECT_NAME"
echo "Location: $PROJECT_DIR"
echo ""

# Copy template
cp -r "$TEMPLATE_DIR" "$PROJECT_DIR"

# Replace placeholder text in PROJECT.md
sed -i "s/\[Project Name\]/$PROJECT_NAME/g" "$PROJECT_DIR/PROJECT.md"
sed -i "s/\[PROJ-XXX\]/PROJ-$(date +%Y%m%d)/g" "$PROJECT_DIR/PROJECT.md"
sed -i "s/\[Planning | Active | Complete | Archived\]/Planning/g" "$PROJECT_DIR/PROJECT.md"
sed -i "s/\[YYYY-MM-DD\]/$(date +%Y-%m-%d)/g" "$PROJECT_DIR/PROJECT.md"

# Replace placeholder in tasks.md
sed -i "s/\[Project Name\]/$PROJECT_NAME/g" "$PROJECT_DIR/orchestration/tasks.md"

# Replace placeholder in MEMORY.md
sed -i "s/\[Project Name\]/$PROJECT_NAME/g" "$PROJECT_DIR/memory/MEMORY.md"
sed -i "s/\[YYYY-MM-DD\]/$(date +%Y-%m-%d)/g" "$PROJECT_DIR/memory/MEMORY.md"

echo "Project scaffolded successfully!"
echo ""
echo "Next steps:"
echo "  1. Edit $PROJECT_DIR/PROJECT.md with project details"
echo "  2. Start an agent session:"
echo "     claude"
echo "     'Read CLAUDE.md and .agent/souls/scrum-master.md, then take on the Scrum Master role.'"
echo "  3. Begin Phase I — Business Understanding"
echo ""
echo "Template directives are shared across all projects at directives/"
echo "Project-specific artifacts go in $PROJECT_DIR/"
