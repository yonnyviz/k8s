variable "PROJECT_ID" {
  description = "GCP Project ID"
}

variable "REGION" {
  default     = "us-west1"
  description = "region"
}

variable "GKE_USERNAME" {
  default     = ""
  description = "gke username"
}

variable "GKE_PASSWORD" {
  default     = ""
  description = "gke password"
}

variable "GKE_NUM_NODES" {
  default     = 1
  description = "number of gke nodes"
}
