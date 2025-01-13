# Kubernetes Commands Documentation

## Working with YAML Files and Pod Management

### Create Resources from YAML
```bash
kubectl create -f namespace.yml [[1]](https://varunmargam.hashnode.dev/kubernetes-fundamentals-understanding-pods-deployments-services-and-manifests)
kubectl create -f pod1.yml
kubectl create -f pod2.yml
```
Creates namespace and pods using YAML definition files

### View Pod Information
```bash
kubectl get pods -n webfront
```
Lists all pods in the webfront namespace

```bash
kubectl describe pod nginx2 -n webfront [[2]](https://medium.com/@tayoefunshile/container-management-kubernetes-pt-2-5baed2b5697b)
```
Shows detailed information about nginx2 pod

```bash
kubectl get pod nginx2 -n webfront -o wide
```
Displays extended information including node and IP details

```bash
kubectl get pod nginx2 -n webfront -o yaml
```
Shows the complete YAML configuration of the pod

### Pod Management
```bash
kubectl delete pod nginx2 -n webfront
kubectl create -f pod2.yml
```
Deletes and recreates the nginx2 pod

### Troubleshooting
```bash
kubectl describe pod nginx2 -n webfront
kubectl logs nginx2 -n webfront
```
Commands for debugging pod issues:
- describe: Shows pod details and events
- logs: Displays pod container logs

## Tips
- Always verify YAML files before applying
- Use -o yaml to export current configuration
- Check logs for troubleshooting issues
- The -n flag specifies the namespace
