#!/usr/bin/env bash
set -euo pipefail

# Spec-Driven Init — Claude Code Skill Installer

SKILL_NAME="init-project"
SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"
REPO_URL="https://github.com/sajiner90/init-project.git"

echo "Installing $SKILL_NAME skill for Claude Code..."
echo ""

# Check if git is available
if ! command -v git &> /dev/null; then
    echo "Error: git is required but not installed."
    exit 1
fi

# Create skills directory if it doesn't exist
mkdir -p "$HOME/.claude/skills"

# Install or update
if [ -d "$SKILL_DIR" ]; then
    echo "Existing installation found. Updating..."
    cd "$SKILL_DIR"
    git pull --ff-only origin main
    echo ""
    echo "Updated successfully."
else
    echo "Cloning $SKILL_NAME..."
    git clone "$REPO_URL" "$SKILL_DIR"
    echo ""
    echo "Installed successfully."
fi

echo ""
echo "Location: $SKILL_DIR"
echo ""
echo "Usage:"
echo "  1. Open Claude Code in any project"
echo "  2. Type: /init-project"
echo ""
echo "Done."
