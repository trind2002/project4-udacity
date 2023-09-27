[![trind2002](https://circleci.com/gh/trind2002/project4-udacity.svg?style=svg)](<https://app.circleci.com/pipelines/github/trind2002/project4-udacity>)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment
Details setup and run at file NOTE.MD

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m venv ~/.devops
source ~/.devops/bin/activate
```
* Run `make install` to install the necessary dependencies

## Setup the Docker
1. Create repo for Amazone ECR: udacity
2. View push command and run step by step
### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
1. You should have a minikube installed
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
What you’ll need to minikube start:
- 2 CPUs or more
- 2GB of free memory
- 20GB of free disk space 
  Note: Increase the Cloud9 memory limits, you can run command:
```bash
df -h
chmod +x resize.sh
./resize.sh 
df -h
```
2. To start a local cluster, type the terminal command:
```bash
minikube start
```
* Create Flask app in Container
1. Build the Docker image
2. Run the container with docker image created
```bash
docker build --tag=udacity .
docker run -p 8000:80 udacity
```
* Run via kubectl
1. Step 1: Export your Docker ID/path: dockerpath=<>
2. Step 2: Deploy an App from the Dockerhub to the Kubernetes Cluster
3. Step 3: List kubernetes pods
4. Step 4: Forward the container port to a host

```bash
dockerpath=trind7
kubectl create deployment udacity-app --image=trind7/udacity:v1.0
kubectl get pods
kubectl port-forward deployment/udacity-app 8080:80
```

