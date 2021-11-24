terraform {
  required_providers {
    aws = "~>3.27"
  }

  required_version = ">=0.12.9" 

   backend "s3" {
       bucket = "terraformremotestate01"
       key    = "my-s3-website"
       region = "eu-west-1"
   }
}

provider "aws" {
  version = "~>3.0"
  region  = "eu-west-1"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "mywebsite231121"
     acl       = "public-read"

     policy  = <<EOF
{
  "Id": "MakePublic",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::mywebsite231121/*",
      "Principal": "*"
    }
  ]
}
EOF

   website {
       index_document = "index.html"
   }
}