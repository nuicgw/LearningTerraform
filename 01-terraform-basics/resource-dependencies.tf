resource "local_file" "whale" {
    filename = "whale.txt"
    content = "whale"
    depends_on = [ local_file.krill ]
}

resource "local_file" "krill" {
    filename = "krill.txt"
    content = "krill"
}