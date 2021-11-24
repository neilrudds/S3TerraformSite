terraform {
  required_providers {
    aws = "~>3.27"
  }

  required_version = ">=0.12.9" 

   backend "s3" {
       bucket = "terraformremotestate01"
       key    = "AKIASGRIKHJUIWWN23WG"
       region = "eu-west-1"
   }
}

provider "aws" {
  version = "~>3.0"
  region  = "eu-west-1"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "githubactionstfsite"
     acl       = "public-read"

     policy  = <<EOF
{
  "Id": "Policy1637744178392",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1637744160936",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::githubactionstfsite",
      "Principal": "*"
    }
  ]
}
EOF

   website {
       index_document = "index.html"
   }
}