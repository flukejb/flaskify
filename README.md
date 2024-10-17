# Flaskify Service

## Description

This repository contains a simple Flask application designed to demonstrate deployment to a Kubernetes cluster. The application responds with a greeting message and serves as a foundational example for deploying a Python web service on Kubernetes.

## Features

- Built with Flask, a lightweight WSGI web application framework.
- Containerized using Docker for easy deployment.
- Configurable for deployment in various environments.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Docker](https://www.docker.com/get-started)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Kubernetes](https://kubernetes.io/docs/setup/)
- [Helm](https://helm.sh/docs/intro/install/) (if using Helm for deployment)

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