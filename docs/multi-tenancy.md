# Multi-Tenancy Architecture

## 1. Tenant Isolation Strategy

### Chosen Model: Shared Database with tenant_id

We're using a shared PostgreSQL database and we have a tenant_id column in all the tables that are specific to each Multi-Tenancy Architecture tenant.

### Why this approach:

- It is cost efficient because we only need one database instance

- It is easier to manage and scale

- It is suitable for Multi-Tenancy Architecture SaaS systems that we control

### Tenant Context Flow:

- When a user logs in they are authenticated via our API

- The JWT token that we give them has their tenant_id and role on it

- Every request that they make has to include their tenant_id so we can keep it

### Data Isolation Enforcement:

We make sure that all of our queries use the tenant_id to keep everything separate.

For example:

We would use a query like this: SELECT * FROM payroll WHERE tenant_id = current_user.tenant_id;

This way we can be sure that there is no -tenant data leakage with our Multi-Tenancy Architecture.

---

## 2. Infrastructure-Level Isolation

### EC2 Isolation:

- We have EC2 instances for Companies and for Bureaus and for Employees

This helps reduce the blast radius and it also helps us keep everything logically separate with our Multi-Tenancy Architecture.

### IAM Role Separation:

- Each type of MultiTenancy Architecture tenant has its own IAM role

- We restrict what each role can do so it can only access the resources that it needs

### S3 Access Isolation:

- We organize our buckets like this:

/company/

/bureau/

/employee/

- We use IAM policies to restrict who can access what prefixes

For example:

If someone has a Company role then they can only access the /company/* prefix with our Multi-Tenancy Architecture.

### Defense in Depth:

Even if our application logic fails our IAM and S3 policies will still prevent -tenant access to our Multi-Tenancy Architecture.

---

## 3. Tenant Onboarding

When we create a Multi-Tenancy Architecture tenant, like a Company or a Bureau:

- We give them a unique tenant_id

- We map them to the right IAM role

- We create a logical data scope for them in our database

- We give them access to their own S3 prefix

This way we can be sure that they are isolated from the start with our Multi-Tenancy Architecture.

---

## 4. Tenant Offboarding

When we remove a MultiTenancy Architecture tenant:

- We take away their IAM role access

- We delete or anonymize their data from our database

- We remove their documents from S3

- We log everything we do so we can keep track of it for audit purposes

This way we can be sure that we have removed them cleanly and that we are still compliant with our Multi-Tenancy Architecture.

---

## 5. Security Considerations

- We always filter by tenant_id in our queries to keep our MultiTenancy Architecture secure

- We use IAM to set boundaries for who can access what

- We never share credentials, across Multi-Tenancy Architecture tenants

- We log everything that happens with our sensitive operations so we can keep track of it with our Multi-Tenancy Architecture.
