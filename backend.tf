terraform {
  backend "gcs" {
    bucket = "terraform-afrozbucket2026123"  # GCS bucket name
    prefix = "terraform/state"              # Path within the bucket (e.g., a folder structure)
  }
}
