### Count

```hcl main.tf
resource "local_file" "pet" {
    filename = var.filename[count.index]
    count = length(var.filename)
}```

```hcl variables.tf
variable "filename" {
    default = [
    "file0.txt",
    "file1.txt",
    "file2.txt"
    ]
}
```
