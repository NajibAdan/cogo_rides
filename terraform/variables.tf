variable "project_id" {
  description = "Name of the GCP Project"
  default = "cogo-rides-gcp"
}

variable "region" {
  description = "Region to create the resources"
  default = "us-central1"
}

variable "credentials" {
  description = "Service Account Credential To Use"
}

variable "dataset_id" {
  description = "Name of the dataset"
  default = "cogo_rides_dwh"
}