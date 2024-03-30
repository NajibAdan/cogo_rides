terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.20.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials)
}

resource "google_storage_bucket" "data_lake" {
  name          = "${var.project_id}_data_lake"
  location      = "US"
  force_destroy = true
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "data_warehouse" {
  dataset_id = var.dataset_id
  location = "US"
}