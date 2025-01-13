# Kubernetes Deployment Management README

This README outlines common `kubectl` commands used for managing Kubernetes Deployments, based on the official Kubernetes documentation.

## Deploying an Application

### Create a Deployment
- **Command**: `kubectl apply -f deployment.yml`
  - **Description**: Applies a Deployment configuration from a YAML file named `deployment.yml`. This creates or updates a Deployment in your Kubernetes cluster.

### Check Status of Pods and Deployments
- **Command**: `kubectl get pods`
  - **Description**: Lists all running Pods in the current namespace.

- **Command**: `kubectl get deployments`
  - **Description**: Displays information about all Deployments.

## Updating an Application

### Update Deployment Image
- **Command**: `kubectl set image nginx-deployment nginx=nginx:1.16.1`
  - **Description**: Updates the Docker image of the container named `nginx` within the `nginx-deployment` to version `1.16.1`.

- **Command**: `kubectl set image nginx-deployment nginx=nginx:latest`
  - **Description**: Updates the Docker image to the latest version available.

### Inspect Pod Details
- **Command**: `kubectl describe pod nginx-deployment-cbdccf466-8hzw7`
  - **Description**: Provides detailed information about a specific pod, useful for troubleshooting or verification after an update.

### Rollback Deployment
- **Command**: `kubectl rollout undo nginx-deployment-695dc5b595`
  - **Description**: Rolls back the Deployment to the previous version. This command might not work as intended due to incorrect syntax; use the next command instead.

- **Command**: `kubectl rollout undo deployment/nginx-deployment`
  - **Description**: Correctly rolls back the `nginx-deployment` to the last stable revision.

## Checking Status After Operations

### View ReplicaSets
- **Command**: `kubectl get rs`
  - **Description**: Lists all ReplicaSets managed by Deployments, showing how many replicas are desired, current, and ready.

### Inspect Pod Images
- **Command**: `kubectl describe pod nginx-deployment-cbdccf466-bsh8m | grep image`
  - **Description**: Shows only the image line from the pod description, confirming the image update.

## Notes
- **Selector and Labels**: Ensure your Deployment's selector and Pod labels do not overlap with other controllers to avoid conflicts.
- **Pod Template**: Changing the Pod template triggers a rollout, but scaling does not.
- **Rollouts**: After updating, you can monitor the rollout status with `kubectl rollout status deployment/nginx-deployment`.

This document covers basic operations for managing Kubernetes Deployments. For more advanced operations or troubleshooting, refer to the official Kubernetes documentation or seek community help.