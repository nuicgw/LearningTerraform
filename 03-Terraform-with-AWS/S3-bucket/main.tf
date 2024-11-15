resource "aws_s3_bucket" "finance" {
  bucket = "nuicgw_15112024"
  tags = {
    Description = "Luke n Aaron"
  }
}

resource "aws_s3_bucket_object" "finance-2024" {
  content = "/root/filename.txt"
  key     = "filename.txt"
  bucket  = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<EOF
    {
      JSON IAM POLICY OBJECT GOES HERE
      you can use reference expressions in the JSON to to reference varaibles for the updated policy
      "resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}
      "principal": "${data.aws_iam_group.finance-data.arn}
  }
  EOF
}
