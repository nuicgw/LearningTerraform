Terraform handles infrastructure as if it is Immutable.
* It does this by replacing existing resources with the new ones. * be careful when creating and editting resources

```sh

terraform show
terraform providers
terraform fmt <filename> # Format
terraform validate # This doesn't catch errors within the entered value. Only checks file layout 
terraform graph # This needs a plugin "graphviz"

``
