resource "aws_s3_bucket" "documents" {
    bucket = "my-documents-bucket-12345"
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