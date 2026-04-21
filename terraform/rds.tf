resource "aws_db_subnet_group" "db_subnet_group" {
    name = "app-db-subnet-group"
    subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    tags = {
        name = "app-db-subnet-group"
    }
}
resource "aws_db_instance" "postgres_db" {
    identifier = "app-db"
    engine = "postgres"
    instance_class = "db.t3.micro"
    allocated_storage = 20
    username = "appadmin"
    password = aws_ssm_parameter.db_password.value
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    skip_final_snapshot = true
    tags = {
        name = "app-postgres-db"
    }
}