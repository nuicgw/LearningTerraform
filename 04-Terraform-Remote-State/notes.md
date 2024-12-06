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

# Terraform State Commands
terraform state <subcommand> [options] [args]
|Subcommand|Description|
|----|---|
|list|List resources in the state|
|mv|Move an item in the state|
|pull|Pull current state and output to remote state|
|push|Update remote state from a local state file|
|replace-provider|Replce provider in the state|
|rm|Remove instances from the state|
|show|Show a resource in the state|
