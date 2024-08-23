resource "local_file" "first-local-file" {
    filename = var.filename
    content = var.file_content
}
