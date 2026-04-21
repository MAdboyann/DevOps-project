resource "aws_s3_bucket" "documents" {
    bucket = "my-app-docs-astir-2026-001"
    tags = {
        name = "documents-bucket" 
        }
}
resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.documents.id
    versioning_configuration {
        status = "Enabled"
    }
}