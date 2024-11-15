# Getting Started with AWS

# Demos Setup an AWS Account

# Introduction to IAM

# Demo IAM

# Programmatic Access
* Need to install AWS CLI for your OS
* Need to configure AWS with `aws configure`
    * AWS Access key ID
    * AWS Secret access key
    * Default region name
    * Default output format
* ~/.aws/credentials

# AWS IAM with Terraform

# IAM Policies with Terraform

# Lab: AWS CLI and IAM
* aws --version
* aws iam
* list-users
* aws --endpoint http://aws:5466 iam list-users
* aws create-user --user-name
* aws --endpoint http://aws:5466 iam create-user --user-name "mary"
* aws iam attach-user-policy --policy-arn arn:aws:iam:aws:policy:/AdministratorAccess --username-name "mary"
* aws iam create-group --group-name project-sapphire-developers
* aws iam add-user-to-group --user-name "jack" 
* aws iam add-user-to-group --user-name "jill"
* aws iam attach-group-policy --policy-arn arn:aws:iam:was:policy/AmazonEC2FullAccess --group-name "project-sapphire-developers"

# AWS IAM with Terraform
```
provider "aws" {
    region = "<your-region>"
    # access_key = "<your-access-key>"
    # secret_key = "<your-secret-key>"
}

resource "aws_iam_user" "admin-user" {
    name = "lucy"
    tags = {
        Description = "Technical team Leader"
    }
}
```
* AWS Access Key and Secret Key should not be kept in the resource block and instead should be stored in `~/.aws/credentials` folder

# IAM Policies with Terraform
* Heredoc file format can used within the policy key
* A .json can be created and used instead of putting the policy inline in the policy resource
```
# main.tf w/ Heredoc
resource "aws_iam_policy" "adminUser" {
    name = "AdminUsers"
    policy = <<EOF
        {
            "Verions": 
            "Statement": {
                "Effect:" <effect>,
                "Action": <action>,
                "Resource": <resource>
            }
        }
    EOF
}
# main.tf w/ json file reference
resource "aws_iam_policy" "adminUser" {
    name = "AdminUsers"
    policy = file("admin.policy.json")
}

# admin-policy.json
{
    "Verions": 
    "Statement": {
        "Effect:" <effect>,
        "Action": <action>,
        "Resource": <resource>
}

# attaching the user policy to the user
resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
    user = aws_iam_user.admin-user.arn
    policy_arn = aws_iam_policy.adminUser.arn
}
```

# Lab: IAM with Terraform
* Create a IAM User called mary with Terraform
```
touch iam-user.tf

# iam-user.tf
resource "aws_iam_user" "users" {
    name = "mary"
}

# aws provider
provider "aws" {
    region = "ca-central-1"
}

# create multiple users with a count
# create a `variables.tf` with the 
variable "project-sapphire-users" {
    type = list(string)
    default = ["mary", "jack", "jill"]
}

# updated users resource block to count and loop through the project-sapphire-users variable
resource "aws_iam_user" "users" {
    name = var.project-sapphire-users[count.index]
    count = length(var.project-sapphire-users)
}
```

# Introduction to AWS S3

# S3 with Terraform
* Creating a S3 bucket
```
resource "aws_s3_bucket" "<terraform_object_name>" {
    bucket = "<aws_bucket_name>"
    tags {
        description = "<aws_bucket_description>"
    }
}
```

* Creating a object in the S3 bucket
```
resource "aws_s3_bucket_object" "<terraform_object_name>" {
    content = "/root/<my_folder>/<my_file>"
    key = "<my_file>"
    bucket = aws_s3_bucket.<aws_bucket_name>.id
}
```

* Creating a IAM group
```
data "aws_iam_group" "terraform_object_name" {
    group_name = "<aws_group_name>"
}

```

* Applying the IAM group to a S3 bucket
```
resource "aws_s3_bucket_policy" "terraform_object_name" {
    bucket = aws_s3_bucket.<aws_bucket_name>.id
    policy = <<EOF
    {
        <json_iam_policy_object_goes_here>
    }
}
```

# Lab: S3

# Introudction to DynamoDB
* NoSQL DB
* Fully managed service by AWS
* Single-Digit MilliSecond Latency
* Data Replicated across Regions

# Demo DynamoDB

# DynamoDB with Terraform
* Creting a AWS DynamoDB Table
    * hash_key = Primary Key and must be specified in an attribute
    * Attribute "S" = String, "N" = Number, "B" Binary
```
resource "aws_dynamodb_table" "<terraform_object_name>" {
    name = "<table_name>"
    hash_key = "VIN"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = "VIN"
        type = "S"
    }
}
```

* Creating a Table Item
```
resource "aws_dynamodb_table_item" "<terraform_object_name>" {
    table_name = aws_dynamodb_table.<table_name>.name
    hash_key = aws_dynamodb_table.<table_name>.hash_key
    item = <<EOF
    {
        <json_iam_policy_object_goes_here>
    }
EOF
}
```

# Lab: DynamoDB
