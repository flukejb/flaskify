# Flaskify Service

## Description

This repository contains a simple Flask application designed to demonstrate deployment to a K8s cluster using the Terraform K8s provider. The application responds with a greeting message and serves as a foundational example for deploying a Python web service on Kubernetes.

## Features

- Built with Flask, a lightweight WSGI web application framework
- Containerized using Docker for easy deployment
- Configurable for deployment in various environments

## Required Tools

- [Docker](https://www.docker.com/get-started)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Kubernetes](https://kubernetes.io/docs/setup/)
- [Helm](https://helm.sh/docs/intro/install/) (optional if using Helm for deployment)
- [KinD] (https://kind.sigs.k8s.io/)

## Running the service with Terraform

1. Run KinD and deploy at least 1 cluster <br>
`kind create cluster --name dev`
2. cd ~/terraform/dev and run `terraform apply`

## Local Validation
1. Enable a port forwarder <br>
`kubectl port-forward <pod-name> 8080:8080 -n flaskify`
2. Run curl locally <br> 
`curl http://localhost:8080`



## Project Structure
```
.
├── Dockerfile
├── README.md
├── app
│   └── flaskify.py
├── k8s
│   └── deployment.yml
├── requirements.txt
└── terraform
    ├── dev
    │   ├── main.tf
    │   └── terraform.tfstate
    └── prod
        └── main.tf