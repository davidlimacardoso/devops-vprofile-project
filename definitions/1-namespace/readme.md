# Kubernetes Commands Documentation

## Namespace and Pod Management [1]

### Create Namespace
```bash
kubectl create ns webfront
```
Creates a new namespace called 'webfront' to isolate and organize resources.

### Deploy Nginx Pods
```bash
kubectl run nginx1 --image=nginx -n webfront
```
Deploys the first Nginx pod using the standard Nginx image in the webfront namespace.

```bash
kubectl run nginx2 --image=nginx:slim -n webfront
```
Deploys the second Nginx pod using the slim version of Nginx image in the webfront namespace.

### Cleanup
```bash
kubectl delete namespace webfront
```
Removes the webfront namespace and all resources within it.

## Notes
- Creating a namespace helps in organizing resources
- The -n flag specifies the namespace
- Using nginx:slim provides a lighter version of the Nginx image
- Deleting a namespace removes all resources inside it

## Tips
- Always verify the namespace before executing commands
- Use kubectl get pods -n webfront to check pod status
- Backup important data before namespace deletion
