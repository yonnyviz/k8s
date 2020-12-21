# k8s automation tool

Wrapper scripts for deploying a k8s cluster.

### Prerequisites

- A Google Cloud Platform account.
- A configured gcloud SDK.
- A system with Terraform installed.
- A system with kubectl installed.


### How to Use

#### Cluster Creation

Creates GKE clusted by passing a GCP Service Account key file.

```
./k8s create [ -f: gcp-credential-file-path ]
```

#### Cluster Destruction

Destroy GKE clusted by passing a GCP Service Account key file.

```
./k8s destroy [ -f: gcp-credential-file-path ]
```
