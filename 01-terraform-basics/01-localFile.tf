resource "local_file" "first-local-file" {
    filename = "first-local-file.txt"
    content = "Hello Terraform"
}
