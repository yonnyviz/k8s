# k8s automation tool

Wrapper scripts for deploying a k8s cluster.

### Prerequisites

- A Google Cloud Platform account.
- A configured gcloud SDK.
- A system with Docker installed.
- A system with Terraform installed.
- A system with kubectl installed.


### How to Use

#### Cluster Creation

Creates GKE clusted by passing a GCP Service Account key file.

```
./k8s create [ -f: key-file-path ] [ -d: dockerfile-folder-path ] [ -n: app-name ]

example:

./k8s.sh create -f key-file.json -d apps/hello-python -n mypythonapp
```

#### Cluster Destruction

Destroy GKE clusted by passing a GCP Service Account key file.

```
./k8s destroy [ -f: gcp-credential-file-path ]
```
