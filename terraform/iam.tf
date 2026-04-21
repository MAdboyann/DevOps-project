resource "aws_iam_role" "company_role" {
    name = "company_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }]
    })
}
resource "aws_iam_role" "bureau_role" {
    name = "bureau_role"
    assume_role_policy = aws_iam_role.company_role.assume_role_policy
}
resource "aws_iam_role" "employee_role" {
    name = "employee_role"
    assume_role_policy = aws_iam_role.company_role.assume_role_policy
}
resource "aws_iam_policy" "s3_policy" {
    name = "tenant_s3_policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = [
                    "s3:GetObject",
                    "s3:PutObject"
                ]
                resource = "${aws_s3_bucket.documents.arn}/*"
            }
        ]
    })
}
resource "aws_iam_role_policy_attachment" "company_attach" {
    role = aws_iam_role.company_role.name
    policy_arn = aws_iam_policy.s3_policy.arn
}