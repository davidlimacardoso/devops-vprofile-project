# Ingress-Nginx Controller Deployment on AWS

This guide outlines the steps to deploy and configure the Ingress-Nginx Controller on an AWS Kubernetes cluster. The Ingress-Nginx Controller provides load balancing, SSL termination, and name-based virtual hosting for Kubernetes services.

## Prerequisites

- A running Kubernetes cluster on AWS
- `kubectl` configured to communicate with your cluster
- Helm (optional but recommended for easier management)

## Steps for Deployment

### 1. Verify Existing Resources
Before deploying, check if there are any existing resources in the `ingress-nginx` namespace:

```bash
kubectl get all -n ingress-nginx
```

2. Deploy Ingress-Nginx Controller
You can deploy the controller using Helm or directly with YAML manifests:

Using Helm:
```bash
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/aws-load-balancer-type"=nlb \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/aws-load-balancer-backend-protocol"=tcp
```

Using YAML Manifests:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.0/deploy/static/provider/aws/deploy.yaml
```

3. Check Load Balancer Details
After deployment, retrieve the external DNS name provided by the AWS Network Load Balancer:

```bash
kubectl get svc ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

This command outputs the DNS name of your load balancer, which you can use to route traffic to your services.

4. Deploy Your Application
Deploy your application using the following steps:


```bash
# Define and apply your deployment configuration
kubectl apply -f vprodeployment.yml
# Expose your deployment with a Kubernetes service
kubectl apply -f vproservice.yml
# Create an Ingress resource to manage external access
kubectl apply -f vproingress.yml

```

5. Post-Deployment Checks

```bash
# Ensure all pods are running
kubectl get pods --namespace=ingress-nginx

# Wait for the ingress controller to be ready
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s
```

6. Access Your Application
Use the DNS name from step 3 to access your application externally.

## Additional Notes
- Firewall Configuration: Ensure ports 80 (HTTP) and 443 (HTTPS) are open on your nodes where the Ingress-Nginx Controller is running.

- Health Checks: The controller service has been set up with health checks for AWS NLB to ensure only healthy backends receive traffic.

- Local Testing: If you need to test locally, you can use kubectl port-forward to forward traffic from your local machine to the ingress controller.
Troubleshooting

Check the logs of the ingress-nginx-controller pod for any issues:

```bash

kubectl logs -n ingress-nginx $(kubectl get pods -n ingress-nginx -l app.kubernetes.io/component=controller -o jsonpath='{.items[0].metadata.name}')

```

Review the status of your Ingress resources to ensure they are properly configured.
This setup provides a robust ingress solution for your AWS Kubernetes cluster, enabling secure and efficient routing of HTTP(S) traffic to your services.