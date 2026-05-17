# CI/CD Pipeline with Jenkins, Docker & Kubernetes

## Project Overview

This project implements an end-to-end CI/CD pipeline for a Spring Boot application using Jenkins, Docker, Docker Hub, and Kubernetes.

The pipeline automates:

- Source code retrieval from GitHub
- Application build using Maven
- Docker image creation
- Docker image push to Docker Hub
- Kubernetes deployment and rolling updates

---

## Architecture

```text
Developer
    ↓
GitHub Repository
    ↓
Jenkins Pipeline
    ↓
Maven Build
    ↓
Docker Image
    ↓
Docker Hub
    ↓
Kubernetes Deployment
   ↙            ↘
Pod 1          Pod 2
      ↓
LoadBalancer Service
      ↓
Browser
```

---

## Tech Stack

- Java 17
- Spring Boot
- Maven
- Git & GitHub
- Jenkins
- Docker
- Docker Hub
- Kubernetes
- Linux (WSL Ubuntu)

---

## Project Structure

```text
devops-java-app/
│
├── src/
│   └── main/java/com/example/App.java
│
├── Dockerfile
├── Jenkinsfile
├── deployment.yaml
├── service.yaml
├── pom.xml
└── README.md
```

---

## Pipeline Workflow

### Step 1: Code Push

Developer pushes code changes to GitHub.

### Step 2: Jenkins Pipeline Trigger

Jenkins pulls the latest source code.

### Step 3: Maven Build

Application build process:

```bash
mvn clean package
```

### Step 4: Docker Image Creation

```bash
docker build -t <docker-username>/devops-java-app:latest .
```

### Step 5: Push Image to Docker Hub

```bash
docker push <docker-username>/devops-java-app:latest
```

### Step 6: Kubernetes Deployment

```bash
kubectl rollout restart deployment devops-java-app
```

---

## Docker Commands

Build image:

```bash
docker build -t devops-java-app .
```

Run container:

```bash
docker run devops-java-app
```

View images:

```bash
docker images
```

---

## Kubernetes Commands

Check pods:

```bash
kubectl get pods
```

Check services:

```bash
kubectl get services
```

Restart deployment:

```bash
kubectl rollout restart deployment devops-java-app
```

---

## Problems Encountered & Solutions

### Maven Not Found

**Cause**

Jenkins container did not contain Maven.

**Solution**

Used Maven Docker agent:

```groovy
agent {
    docker {
        image 'maven:3.9.9-eclipse-temurin-17'
    }
}
```

---

### Docker Push Access Denied

**Cause**

Docker Hub authentication missing.

**Solution**

Authenticated Jenkins with Docker Hub.

---

### kubectl Not Found

**Cause**

kubectl was not installed inside Jenkins.

**Solution**

Installed kubectl inside Jenkins container.

---

### Kubernetes Authentication Failure

**Cause**

Jenkins lacked Kubernetes cluster configuration.

**Solution**

Copied kube config into Jenkins container.

---

### CrashLoopBackOff

**Cause**

Application terminated immediately after startup.

**Solution**

Converted application into a Spring Boot web application.

---

## Key Learnings

- CI vs CD concepts
- Jenkins Declarative Pipeline
- Docker containerization
- Docker Hub integration
- Kubernetes deployments and services
- Rolling updates
- Kubernetes authentication
- Pipeline as Code approach

---

## Final Outcome

Successfully built an automated CI/CD pipeline that:

✔ Builds application automatically  
✔ Creates Docker images  
✔ Pushes images to Docker Hub  
✔ Deploys to Kubernetes  
✔ Performs rolling updates automatically  

---

## Output

Application successfully deployed and accessible through browser:

```text
Hello from Jenkins + Docker + Kubernetes CI/CD Pipeline!
```
