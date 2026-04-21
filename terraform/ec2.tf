resource "aws_instance" "company_ec2" {
    ami = "ami-098e39bafa7e7303d"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet_1.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    tags = {
        name = "company-server" 
        Tenant = "company"  }
}
resource "aws_instance" "bureau_ec2" {
    ami = "ami-098e39bafa7e7303d"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet_1.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    tags = {
        name = "bureau-server"
        Tenant = "bureau"  }
}
resource "aws_instance" "employee_ec2" {
    ami = "ami-098e39bafa7e7303d"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet_2.id
    tags = {
        name = "employee-server"
        Tenant = "employee"  }
}