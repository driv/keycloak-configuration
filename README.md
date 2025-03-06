# Keycloak & Grafana Infrastructure Setup

This repository contains the necessary configurations to deploy and manage a **Keycloak** instance with **Grafana** and supporting infrastructure. It uses tools like **Helm**, **Kustomize**, **Crossplane**, and **Kubernetes** to manage and automate the provisioning of these resources.

## Prerequisites

Before using this repository, ensure you have the following tools installed:

- **kubectl** – Kubernetes command-line tool.
- **Helm** – Package manager for Kubernetes.
- **Kustomize** – Tool for customizing Kubernetes YAML configurations.
- **Crossplane CLI** (optional, for managing resources through Crossplane).
- **bash** – For running scripts.

You also need access to a **Kubernetes cluster** and necessary permissions to deploy resources.

## Quick Start

### 1. Set up your Kubernetes Cluster
Ensure that your Kubernetes cluster is up and running. You can use any Kubernetes provider, such as **Minikube**, **EKS**, **GKE**, or **AKS**.

### 2. Configure Helm and Kustomize
Before deploying, you may need to configure Helm and Kustomize. The repository includes several Helm and Kustomize configurations to deploy **Keycloak**, **Grafana**, and the **infrastructure**.

### 3. Deploy Keycloak

To deploy **Keycloak**, use the **Kustomize** tool for the resources in the `keycloak-instance/` directory:

1. Apply the Keycloak resources:
    ```bash
    kubectl apply -k keycloak-instance/
    ```

This will deploy Keycloak, set up the database, and create the associated secrets.

### 4. Deploy Crossplane Resources

1. Apply Crossplane resources:
    ```bash
    helmfile apply -f crossplane/helmfile.yaml
    ```

This will configure Crossplane with the necessary provider and resource management configurations for Keycloak.

### 5. Provision Keycloak Clients and Realms

```bash
kubectl apply -k keycloak-provisioning
```

### 7. Deploy Grafana

To deploy **Grafana**, use **Helmfile** for the resources in the `grafana/` directory:

1. Apply the Grafana configuration with Helm:
    ```bash
    helmfile apply -f grafana/helmfile.yaml
    ```

This will install and configure Grafana using the provided values in `grafana-values.yaml`.
