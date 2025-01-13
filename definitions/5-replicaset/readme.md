# Kubernetes ReplicaSet Management Guide

This guide demonstrates how to manage a frontend application using Kubernetes ReplicaSet.

## Prerequisites
- Kubernetes cluster is set up and running
- kubectl is installed and configured
- frontend.yml file with ReplicaSet configuration

## Basic Operations

1. Create ReplicaSet:

```bash
kubectl create -f frontend.yml 
```

Description : Creates a new namespace called webfront. Namespaces are used to organize and isolate resources within a Kubernetes cluster.

2. Run Nginx Pod (Default Image)

```sh
kubectl run nginx1 --image=nginx -n webfront

```

Description : Deploys a pod named nginx1 using the default Nginx image in the webfront namespace.

3. Run Nginx Pod (Slim Version)

```sh
kubectl run nginx2 --image=nginx:slim -n webfront

```
Description : Deploys a pod named nginx2 using the lightweight Nginx slim image in the webfront namespace.

4. Delete Namespace

```sh
kubectl delete namespace webfront

```

Description : Removes the webfront namespace and all resources within it (including both Nginx pods).

Important Notes
Make sure you have the necessary permissions to execute these commands in your Kubernetes cluster

Deleting a namespace will delete ALL resources within it

You can check the status of your namespace using: kubectl get ns

To view pods in the namespace: kubectl get pods -n webfront

## Best Practices
Always verify the target namespace before creating or deleting resources

Consider using resource limits for pods when deploying to production

Back up any important data before deleting namespaces


This README provides a clear structure and explanation of each command, along with important notes and best practices for working with Kubernetes namespaces and pods.
