module logging {
  source = "../"

  parent_resource_id = "project-id"
  storage_bucket_name = "unique-storage-name"
  log_sinks = [
    { 
        name = "logsink-1",
        filter = "resource.type = gcs_bucket"
    },
    { 
        name = "logsink-2",
        filter = "resource.type = gcs_bucket AND protoPayload.methodName = storage.buckets.delete"
    },
]
  unique_writer_identity = true
}
