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

### For-each
With set of string

``` main.tf
resource "local_file" "pet" {
    filename = each.value

    for_each = var.filname
}
```

```variables.tf
variable "filename" {
    type=set(string)
    default = [
        "file0.txt",
        "file1.txt",
        "file2.txt"
    ]
}
```

With a list of string
* Need to change for_each to toset(var.filename), to convert list to a set
* Need to change type in variable.tf to a list(string)

``` main.tf
resource "local_file" "pet" {
    filename = each.value

    for_each = toset(var.filename)
}
```

```variables.tf
variable "filename" {
    type=list(string)
    default = [
        "file0.txt",
        "file1.txt",
        "file2.txt"
    ]
}
```


Test
