terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.48.0"
        }
    }
    

    # remote state storage location
    backend "s3" {
        bucket         = "remote-state-maxdevopstech"
        key            = "roboshop-backend-ald.tfstate"
        region         = "us-east-1"
        encrypt        = true
        use_lockfile   = true # Enables native S3 state locking (Terraform 1.10+)
    }
    }

    provider "aws" {
    region = "us-east-1"
    }