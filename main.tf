resource "google_logging_project_sink" "sink" {
  for_each = {
    for sink in var.log_sinks :
    sink.name => sink
  }
  name                   = each.value.name
  project                = var.parent_resource_id
  filter                 = each.value.filter
  destination            = "storage.googleapis.com/${var.storage_bucket_name}"
  unique_writer_identity = var.unique_writer_identity
}

resource "google_storage_bucket_iam_member" "storage_sink_member" {
  for_each = {
    for sink in var.log_sinks :
    sink.name => sink
  }
  bucket = var.storage_bucket_name
  role   = "roles/storage.objectCreator"
  member = google_logging_project_sink.sink[each.value.name].writer_identity

  depends_on = [google_logging_project_sink.sink]
}
