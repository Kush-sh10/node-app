#!/bin/bash

# Set the target directory and port based on deployment group
if [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Dev-Group" ]]; then
    APP_DIR="/home/ubuntu/my-app-dev"
    PORT=3001
elif [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Prod-Group" ]]; then
    APP_DIR="/home/ubuntu/my-app-prod"
    PORT=3000
else
    echo "Unknown deployment group: $DEPLOYMENT_GROUP_NAME"
    exit 1
fi

cd "$APP_DIR"

# Stop existing app if running (example: node server)
fuser -k $PORT/tcp || true

# Start app
nohup npm start > server.log 2>&1 &
