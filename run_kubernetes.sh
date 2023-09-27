#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=trind7
# Step 2
# Run the Docker Hub container with kubernetes
## Deploy an App from the Dockerhub to the Kubernetes Cluster
kubectl create deployment udacity-app --image=trind7/udacity:v1.0

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/udacity-app 8080:80
