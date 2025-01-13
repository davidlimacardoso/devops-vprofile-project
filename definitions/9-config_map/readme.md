# Kubernetes ConfigMap Usage README

This README provides an overview of common `kubectl` commands used for managing ConfigMaps in Kubernetes, particularly focusing on the examples from the Kubernetes documentation.

## Prerequisites

- Ensure you have `kubectl` installed and configured to communicate with your Kubernetes cluster.
- Familiarity with YAML configuration files and basic Kubernetes concepts.

## Commands Overview

### 1. Applying a ConfigMap Configuration

```bash
kubectl apply -f config.yml
```
- Description: Creates or updates a ConfigMap from a YAML file (config.yml). This command is used to apply the configuration to the cluster.

2. Listing ConfigMaps
```sh
kubectl get cm
```

3. Applying a Game Demo ConfigMap
bash

Copiar
kubectl apply -f game-demo.yml
Description: Similar to the above, but specifically applies a ConfigMap for a game demo scenario, assuming game-demo.yml contains the necessary ConfigMap definition.
4. Viewing Pods
```bash

kubectl get pod
```

Description: Lists all pods in the current namespace, useful for checking if the pods referencing the ConfigMap are running.


5. Checking Logs from a Pod

```bash
kubectl logs pod_name -f
```

Description: Retrieves the logs from a specified pod. The -f flag allows following the log output in real-time.

6. Describing a Pod
```bash
kubectl describe pod configmap-demo-pod
```

Description: Provides detailed information about a specific pod, including its configuration, status, and events which can help in troubleshooting.

7. Executing Commands in a Pod

```bash
kubectl exec --stdin --tty configmap-demo-pod -- bin/sh
```
Description: Executes a command inside the pod. Here, --stdin and --tty options allow for an interactive shell session.

## Usage Notes
Namespace: All commands operate within the current namespace unless otherwise specified with --namespace or -n flag.

Error Handling: Ensure the YAML files are correctly formatted and the resources (like ConfigMaps or Pods) exist before running commands that interact with them.

ConfigMap Updates: Remember that ConfigMaps mounted as volumes are automatically updated, but those used as environment variables require a pod restart to reflect changes.

Additional Tips
Always use kubectl apply to manage configurations to ensure idempotence.

Use kubectl describe when you need detailed information for debugging or understanding the current state of resources.

For real-time debugging or interaction with pods, kubectl exec is very useful.

This document should serve as a quick reference for managing ConfigMaps and interacting with pods in Kubernetes using kubectl commands.