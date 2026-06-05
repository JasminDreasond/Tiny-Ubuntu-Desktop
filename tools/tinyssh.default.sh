#!/bin/bash

# Tiny SSH :3
# Idea by JasminDreasond
# Made with Google Gemini

# --- EDIT YOUR FILE HERE ---
REMOTE_HOST=""          # The remote host you want to access. Ex: server.example.com
PASSWORD_HOST=""        # The SSH password (Use sshpass -p)
DEFAULT_SSH_PORT=22    # Port through which the SSH tunnel will be established

# Local IP address for proxy listening. 
# Use "127.0.0.1" (localhost only) or "0.0.0.0" (all available IPs).
BIND_ADDRESS="127.0.0.1"

# Identity file path (leave empty "" to disable)
IDENTITY_FILE=""

# Set to "true" to open the server terminal, 
# or "false" to keep it as a quiet tunnel only (-N).
ENABLE_TERMINAL="true"
# ---------------------------

# Function to check and install dependencies
check_dependencies() {
    PACKAGES_TO_INSTALL=()

    if ! command -v ssh &> /dev/null; then
        PACKAGES_TO_INSTALL+=("openssh-client")
    fi

    if ! command -v sshpass &> /dev/null; then
        PACKAGES_TO_INSTALL+=("sshpass")
    fi

    if [ ${#PACKAGES_TO_INSTALL[@]} -ne 0 ]; then
        echo "Missing dependencies: ${PACKAGES_TO_INSTALL[*]}"
        read -p "Would you like to install them now? (y/n): " choice
        case "$choice" in 
            [Yy]* ) 
                echo "Updating and installing packages..."
                sudo apt update && sudo apt install -y "${PACKAGES_TO_INSTALL[@]}"
                ;;
            * ) 
                echo "Error: Dependencies are required to run this script."
                exit 1
                ;;
        esac
    fi
}

# Run dependency check
check_dependencies

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
echo "Remote Host:  $REMOTE_HOST"
echo "Local Proxy Port (Listening at): $LOCAL_PORT (Binding to IP: $BIND_ADDRESS)" 
echo "Target Remote Port: $REMOTE_PORT"
echo "SSH Tunnel Gateway Port:    $SSH_PORT"
[ -n "$IDENTITY_FILE" ] && echo "Identity File Path:    $IDENTITY_FILE"
echo "Operation Mode:        $( [ "$ENABLE_TERMINAL" = "true" ] && echo "Interactive Terminal Session" || echo "Tunnel Only (Quiet)")"
echo "----------------------------------------"

# Executing the command
sshpass -p "$PASSWORD_HOST" ssh $ID_OPT $N_FLAG -L "$LOCAL_PORT:$BIND_ADDRESS:$REMOTE_PORT" "$REMOTE_HOST" -p "$SSH_PORT"