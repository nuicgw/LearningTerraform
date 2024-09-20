### Version Constraints
Version contraints can use multiple operators to help define which version should be used
* >  - Will use the highest version available above the specified version
* <  - Will use the highest version available below the specified version
* != - Will not use this version and instead will use the previous verion
* ~> - Specific version or any incremental above the specified version
    * "~> 1.2" will be able to download between 1.2 and 1.9
    * "~> 1.2.1" will be able to download between 1.2.1 - 1.2.9

```hcl main.tf
terraform {
    required_providers {
        local = {
            source = hashicorp/local
            version = "~> 1.2"
        }
    }
}

resource "local_file" "pet" {
    filename = "filename01"
    content = "file content"
}
```
