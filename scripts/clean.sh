#!/bin/bash

echo "Cleaning temp and target deployment folders..."

# Clean temp folder
rm -rf /home/ubuntu/app_temp/*

# Check CODEDEPLOY_GROUP_NAME to decide target
if [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Dev-Group" ]]; then
    TARGET_DIR="/home/ubuntu/my-app-dev"
elif [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Prod-Group" ]]; then
    TARGET_DIR="/home/ubuntu/my-app-prod"
else
    echo "Unknown deployment group: $DEPLOYMENT_GROUP_NAME"
    exit 1
fi

# Clean old files in the target directory
rm -rf "$TARGET_DIR"/*

echo "Clean complete for $TARGET_DIR"
