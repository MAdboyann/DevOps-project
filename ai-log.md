# AI Usage Log

This document records how AI tools were used during the assignment.

---

## 1. Terraform Network Setup

### Prompt
"Terraform AWS VPC with public and private subnets"

### AI Response Summary
Generated VPC, subnets, internet gateway, and route tables.

### What I Modified
- Structured code into multiple files (vpc.tf, igw.tf, route_tables.tf)
- Parameterized region using variables
- Ensured proper separation of public and private subnets

### Reasoning
To improve readability, maintainability, and ensure proper network isolation.

---

## 2. Compute & Storage

### Prompt
"Terraform EC2, RDS PostgreSQL, and S3 configuration"

### AI Response Summary
Provided base configuration for compute and storage resources.

### What I Modified
- Created separate EC2 instances for each tenant type
- Placed RDS in private subnets using subnet groups
- Enabled S3 versioning for data safety

### Reasoning
To enforce tenant-level isolation and ensure secure, reliable storage.

---

## 3. Security Implementation

### Prompt
"Terraform IAM roles, security groups, and secrets management"

### AI Response Summary
Generated IAM roles, security group rules, and SSM parameter setup.

### What I Modified
- Restricted SSH access to specific IP
- Limited RDS access to EC2 security group only
- Replaced hardcoded database password with SSM parameter

### Reasoning
To enforce least privilege, reduce attack surface, and secure sensitive credentials.

---

## 4. Multi-Tenancy Design

### Prompt
"Design multi-tenant architecture for SaaS"

### AI Response Summary
Suggested shared database with tenant_id-based isolation.

### What I Modified
- Added infrastructure-level isolation using EC2 and IAM
- Included onboarding and offboarding processes

### Reasoning
To ensure both application-level and infrastructure-level tenant isolation.

---

## 5. CI/CD Pipeline

### Prompt
"GitHub Actions pipeline to build and deploy Docker app to EC2"

### AI Response Summary
Provided CI/CD workflow for building Docker image and deploying via SSH.

### What I Modified
- Simplified pipeline steps
- Avoided container registry usage
- Structured deployment using SCP + SSH

### Reasoning
To create a lightweight and cost-effective deployment pipeline.

---

## 6. Monitoring

### Prompt
"CloudWatch alarms for EC2 and RDS with SNS alerts"

### AI Response Summary
Generated monitoring configuration with alerts.

### What I Modified
- Linked alarms to SNS topic
- Defined practical thresholds for CPU and DB connections

### Reasoning
To enable proactive monitoring and faster incident response.

---

## 7. Incident Runbook

### Prompt
"Incident response steps for publicly exposed database"

### AI Response Summary
Provided structured detection, response, and recovery steps.

### What I Modified
- Simplified steps
- Aligned actions with AWS services (CloudWatch, CloudTrail)

### Reasoning
To ensure clarity and practical usability in real incidents.

---
### Prompt
"Create a simple AWS architecture diagram for a multi-tenant application with VPC, public and private subnets, EC2 instances for company, bureau, and employee, RDS in private subnet, S3 storage, IAM, CloudWatch, SNS, and CI/CD pipeline using GitHub Actions. Keep it minimal and clean. Do not include WAF or Route53."

### AI Response Summary
Generated a clean AWS architecture diagram showing VPC, EC2 instances per tenant, RDS, S3, IAM, monitoring services, and CI/CD pipeline.

### What I Modified
- Removed unnecessary components like WAF and Route53
- Simplified layout to match actual Terraform implementation
- Renamed system to "my-app"

### Reasoning
To ensure the diagram accurately reflects the implemented infrastructure and avoids confusion during evaluation.
