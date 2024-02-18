# Creating a KMS key specifically for encrypting the lottery data bucket
resource "aws_kms_key" "lottery_data_bucket_key" {
  description = "KMS key for encrypting the lottery data bucket"
  is_enabled  = true
}

# Define the S3 bucket to store lottery data
resource "aws_s3_bucket" "lottery_data_bucket" {
  bucket = "lottery-data-bucket"

  tags = {
    Name = "lottery-data-bucket"
  }
}

# Enablilng Versioning
resource "aws_s3_bucket_versioning" "versioning_lottery_data_bucket" {
  bucket = aws_s3_bucket.lottery_data_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Defining server-side encryption configuration for the S3 bucket 
resource "aws_s3_bucket_server_side_encryption_configuration" "lottery_data_bucket_sse" {
  bucket = aws_s3_bucket.lottery_data_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.lottery_data_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Uploading the lottery data file to the encrypted S3 bucket
resource "aws_s3_bucket_object" "lottery_data_file" {
  bucket = aws_s3_bucket.lottery_data_bucket.bucket
  key    = "lottery-data-file.csv"
  source = "/home/user/terraform-git-project/lotto.csv"
}

