resource "aws_ssm_parameter" "db_password" {
    name = "/app/db/db_password"
    type = "SecureString"
    value = "postgres123"
}