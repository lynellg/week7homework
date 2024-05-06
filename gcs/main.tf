resource "google_storage_bucket" "bucket1" {
  name = "terraform-state-bucket-1234567890"
  location = "US"
  storage_class = "nearline"
  labels = {
    environment = "tf_env"
    "department" = "compliance"
  }
  uniform_bucket_level_access = true

    lifecycle_rule {
    condition {
      age = 9
    }
    action {
      type = "SetStorageClass"
      storage_class = "coldline"
    }
  }


retention_policy {
    is_locked = true
    retention_period = 777600
  }
}


resource "google_storage_bucket_object" "horse-y" {
  bucket = google_storage_bucket.bucket1.name
  name = "racecar"
  source = "racecar.jpg"
}