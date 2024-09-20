# Additional Terraform Commands
```sh
terraform show
terraform providers
terraform fmt <filename> # Format
terraform validate # This doesn't catch errors within the entered value. Only checks file layout 
terraform graph # This needs a plugin "graphviz"
```

# Mutable vs Immutable
Terraform handles infrastructure as if it is Immutable.
* It does this by replacing existing resources with the new ones. * be careful when creating and editting resources

# Life Cycle Rules
create_before_destory       | Create the resource first and then destory older
prevent_destroy             | Prevents destroy of resource
ignore_changes              | Ignore Changes to Resources Attributes (spcific/all)

```sh
lifecycle {
    ignore_changes = [
        tags
    ]
}
```

# Data Sources
Data Sources only Reads infrastructure

Data block variables are defined from the Data Source and not from the resource block. 
The data block's variables can be read from the resource block using the following example;
* `content = data.local_file.datasource.filename`


```sh
resource "local_file" "file" {
    filename = "/my/local_file.txt"
    content = data.local_file.datasource.filename
}

data "local_file" "datasource" {
    filename = "/my/datasource.txt"
}
```
