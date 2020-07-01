output log_sink_resource_id {
  description = "The resource ID of the log sink that was created."
  value = {
    for name, sink in google_logging_project_sink.sink :
    name => sink.id
  }
}

output writer_identity {
  description = "The service account that logging uses to write log entries to the destination."
  value = {
    for name, sink in google_logging_project_sink.sink :
    name => sink.writer_identity
  }
}
