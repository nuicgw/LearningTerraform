resource "local_file" "first-local-file" {
    filename = var.filename
    content = "Random Pet name ${random_pet.aarons-pet.id}"
}

resource "random_pet" "aarons-pet" {
    length = 8
    prefix = "Mr"
    separator = "."
}
