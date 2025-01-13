# Kubernetes Deployment Commands

This README provides an overview of the commands used to deploy and manage a Kubernetes application using various YAML configuration files.

## Commands

### 1. Create a Service with NodePort

```sh
kubectl create -f vproapp-nodeport.yml
```

This command creates a Kubernetes Service of type NodePort using the configuration specified in vproapp-nodeport.yml. A NodePort service exposes the application on a static port on each node's IP address.

2. Create a Pod

```sh
kubectl create -f vproapppod.yml
```

This command creates a Kubernetes Pod using the configuration specified in vproapppod.yml. A Pod is the smallest deployable unit in Kubernetes that can contain one or more containers.

3. Create a Service with LoadBalancer

```sh
kubectl create -f vproapp-loadbalancer.yml
```

This command creates a Kubernetes Service of type LoadBalancer using the configuration specified in vproapp-loadbalancer.yml. A LoadBalancer service exposes the application externally using a cloud provider's load balancer.

4. Get Services

```sh
kubectl get svc
```

This command lists all the services in the current namespace. It provides details such as the service name, type, cluster IP, external IP, ports, and age.

5. Get LoadBalancer Service Hostname

```sh
kubectl get svc helloworld-service-lb -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

This command retrieves the hostname of the load balancer associated with the helloworld-service-lb service. The output is formatted using JSONPath to extract the hostname directly.

6. Describe LoadBalancer Service

```sh

kubectl describe svc helloworld-service-lb
```

This command provides detailed information about the helloworld-service-lb service. It includes details such as the service endpoints, selector, type, IPs, ports, and events.

Notes

Ensure that the YAML configuration files (vproapp-nodeport.yml, vproapppod.yml, vproapp-loadbalancer.yml) are correctly defined and located in the directory from which you run the commands.

The kubectl commands assume that you have a functioning Kubernetes cluster and that kubectl is properly configured to interact with it.

The helloworld-service-lb service name should be replaced with the actual service name if it differs.