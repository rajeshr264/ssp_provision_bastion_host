#!/bin/bash

# Remote server details
REMOTE_HOST=$1     # Remote host IP or hostname
SSH_KEY_PATH=$2    # SSH private key file
REMOTE_USER=$3     # SSH username

RETRY_INTERVAL=10                 # Time in seconds between retries

# Function to check if SSH is available
function check_ssh() {
    ssh -i "$SSH_KEY_PATH" -o BatchMode=yes -o ConnectTimeout=5 "$REMOTE_USER@$REMOTE_HOST" "exit" 2>/dev/null
    return $?
}

# Loop until SSH is available
until check_ssh; do
    echo "SSH is not available, retrying in $RETRY_INTERVAL seconds..."
    sleep $RETRY_INTERVAL
done

echo "SSH is running on $REMOTE_HOST!"
