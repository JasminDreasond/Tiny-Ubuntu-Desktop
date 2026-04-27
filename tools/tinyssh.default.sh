#!/bin/bash

# Tiny SSH :3
# Idea by JasminDreasond
# Made with Google Gemini

# Documentation:
# $1 = Local and Remote Port (if only two arguments are passed)
# $2 = SSH Port

if [ "$#" -eq 2 ]; then
    # Case: User provided 2 arguments
    LOCAL_PORT=$1
    REMOTE_PORT=$1
    SSH_PORT=$2
else
    # Fallback/Default values if arguments are missing or different
    LOCAL_PORT=${1:-8080}
    REMOTE_PORT=${2:-8080}
    SSH_PORT=${3:-22}
fi

# Default values if no arguments are provided
# EDIT YOUR FILE HERE!!!!!!!!!
REMOTE_HOST=""
PASSWORD_HOST=""

echo "----------------------------------------"
echo "Starting SSH Tunnel..."
echo "Local Port:  $LOCAL_PORT"
echo "Remote Port: $REMOTE_PORT"
echo "SSH Port:    $SSH_PORT"
echo "----------------------------------------"

# Using sshpass with an empty password as requested
# -N: Do not execute a remote command (perfect for tunnels)
# -f: Requests ssh to go to background just before command execution
sshpass -p "$PASSWORD_HOST" ssh -L "$LOCAL_PORT:127.0.0.1:$REMOTE_PORT" "$REMOTE_HOST" -p "$SSH_PORT"
