#!/bin/bash

# Tiny SSH :3
# Idea by JasminDreasond
# Made with Google Gemini

# --- EDIT YOUR FILE HERE ---
REMOTE_HOST=""
PASSWORD_HOST=""
DEFAULT_SSH_PORT=22

# Identity file path (leave empty "" to disable)
IDENTITY_FILE=""

# Set to "true" to open the server terminal, 
# or "false" to keep it as a quiet tunnel only (-N).
ENABLE_TERMINAL="true"
# ---------------------------

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

# Check if IdentityFile is provided
ID_OPT=""
if [ -n "$IDENTITY_FILE" ]; then
    ID_OPT="-o IdentityFile=$IDENTITY_FILE"
fi

# Terminal vs Tunnel-only logic
N_FLAG="-N"
if [ "$ENABLE_TERMINAL" = "true" ]; then
    N_FLAG=""
fi

echo "----------------------------------------"
echo "Starting SSH Tunnel..."
echo "Remote Host: $REMOTE_HOST"
echo "Local Port:  $LOCAL_PORT"
echo "Remote Port: $REMOTE_PORT"
echo "SSH Port:    $SSH_PORT"
[ -n "$IDENTITY_FILE" ] && echo "Identity:    $IDENTITY_FILE"
echo "Mode:        $( [ "$ENABLE_TERMINAL" = "true" ] && echo "Interactive Terminal" || echo "Tunnel Only" )"
echo "----------------------------------------"

# Executing the command
sshpass -p "$PASSWORD_HOST" ssh $ID_OPT $N_FLAG -L "$LOCAL_PORT:127.0.0.1:$REMOTE_PORT" "$REMOTE_HOST" -p "$SSH_PORT"