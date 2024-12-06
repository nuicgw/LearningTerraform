# Remote State
* Not good idea to store state files in git, instead should be stored in secure remote storage
* Better to create a Terraform resource as a seperate file instead of storing in your config files e.g. "main.tf"

Terraform resource backend block
```
terraform {
    backend "remote" {
        bucket = <your-bucket-name>
        key = <folder/destination-state-file-name>
        region = <your-region>
    }
}
```
