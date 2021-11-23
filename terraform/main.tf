terraform {
  required_providers {
    aws = "~>3.27"
  }

  required_version = ">=0.14.9" 

   backend "s3" {
       bucket = "[terraformremotestate01]"
       key    = "[AKIASGRIKHJUIWWN23WG]"
       region = "eu-west-1"
   }
}

provider "aws" {
  version = "~>3.0"
  region  = "eu-west-1"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "[githubactionstfsite]"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::[githubactionstfsite]/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}