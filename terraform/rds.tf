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
    username = "admin-postgres"
    password = "postgres123"
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
    skip_final_snapshot = true
    tags = {
        name = "app-postgres-db"
    }
}