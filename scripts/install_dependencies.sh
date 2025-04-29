#!/bin/bash

# Set the target directory based on deployment group
if [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Dev-Group" ]]; then
    TARGET_DIR="/home/ubuntu/my-app-dev"
elif [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Prod-Group" ]]; then
    TARGET_DIR="/home/ubuntu/my-app-prod"
else
    echo "Unknown deployment group: $DEPLOYMENT_GROUP_NAME"
    exit 1
fi

# Copy from the temp folder to the target directory
cp -r /home/ubuntu/code-deploy-temp/* "$TARGET_DIR"

cd "$TARGET_DIR"
npm install
