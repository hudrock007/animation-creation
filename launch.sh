#!/bin/bash
# Animation Creation Launcher Script
# Starts the animation editor with proper environment setup

set -a
source .env 2>/dev/null || true
set +a

echo "🎬 Animation Creation - Scene Animator"
echo "======================================="
echo "Starting server on http://${SERVER_HOST}:${SERVER_PORT}"
echo ""

# Check if Python is available
if command -v python3 &> /dev/null; then
    python3 -m http.server ${SERVER_PORT:-8000} --bind ${SERVER_HOST:-localhost}
elif command -v python &> /dev/null; then
    python -m http.server ${SERVER_PORT:-8000} --bind ${SERVER_HOST:-localhost}
else
    echo "❌ Error: Python not found. Please install Python 3."
    exit 1
fi
