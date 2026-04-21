# Incident Response Runbook
## Scenario:
RDS database becomes accessible to the public.
---
## 1. Detection
- Triggered by CloudWatch alerts (abnormal activity or connections)
- Alert generated from AWS Config/Safe
- Manual detection through monitoring dashboards
---
## 2. Immediate Actions


- Locate the compromised RDS resource

- Configure the security group to revoke public access (0.0.0.0/0)

- Confirm that the database exists within a private subnet

- Optionally block all incoming traffic if necessary


---
## 3. Root Cause Analysis


- Investigate recent adjustments made in:

  - Security groups
  - IAM permissions
  - Terraform commit history

- Analyze CloudTrail logs for suspicious activity

- Determine the root cause of the exposure


---
## 4. Remediation


- Restore the appropriate security group rules

- Restrict access to RDS instances exclusively from EC2 servers

- Restart services as needed

- Test application functionality


---
## 5. Mitigation


- Mandate that all infrastructure modifications be done using Terraform

- Activate notifications for any changes in security groups

- Adopt least-privilege IAM policies

- Regularly conduct security assessments


---
## 6. Post-Incident Activities

- Document the incident chronology
- Note the measures taken during response
- Enhance monitoring and alerting systems
