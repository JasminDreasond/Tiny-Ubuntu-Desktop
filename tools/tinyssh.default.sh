#!/bin/bash

# Tiny SSH :3
# Idea by JasminDreasond
# Made with Google Gemini

# Default values if no arguments are provided
# EDIT YOUR FILE HERE!!!!!!!!!
REMOTE_HOST=""
PASSWORD_HOST=""
DEFAULT_SSH_PORT=22

case $# in
  1)
    # Only 1 argument: Use it for both local and remote ports
    LOCAL_PORT=$1
    REMOTE_PORT=$1
    SSH_PORT=$DEFAULT_SSH_PORT
    ;;
  2)
    # 2 arguments: First is both ports, second is SSH port
    LOCAL_PORT=$1
    REMOTE_PORT=$1
    SSH_PORT=$2
    ;;
  3)
    # 3 arguments: Full manual control
    LOCAL_PORT=$1
    REMOTE_PORT=$2
    SSH_PORT=$3
    ;;
  *)
    # No arguments or more than 3: Use defaults
    LOCAL_PORT=8080
    REMOTE_PORT=8080
    SSH_PORT=$DEFAULT_SSH_PORT
    ;;
esac

echo "----------------------------------------"
echo "Starting SSH Tunnel..."
echo "Remote Host: $REMOTE_HOST"
echo "Local Port:  $LOCAL_PORT"
echo "Remote Port: $REMOTE_PORT"
echo "SSH Port:    $SSH_PORT"
echo "----------------------------------------"

# Using sshpass with an empty password as requested
# -N: Do not execute a remote command (perfect for tunnels)
# -f: Requests ssh to go to background just before command execution
sshpass -p "$PASSWORD_HOST" ssh -L "$LOCAL_PORT:127.0.0.1:$REMOTE_PORT" "$REMOTE_HOST" -p "$SSH_PORT"
