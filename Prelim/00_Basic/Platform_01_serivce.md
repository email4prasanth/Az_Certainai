# Azure Services Overview

## 1. Compute Services: Virtual Machine (VM)
- **Purpose:** Provides scalable, on-demand cloud-based virtualized computing.
- **When to use:** When you need a customizable server environment — for running applications, hosting websites, or deploying software that requires control over the OS and runtime.
- **Why:** Offers flexibility and power for running complex workloads, testing environments, and production applications.

## 2. Storage: Azure Blob Storage
- **Purpose:** Object storage optimized for storing massive amounts of unstructured data — like images, videos, logs, and backups.
- **When to use:** When you need scalable, secure, and durable storage for files, logs, and multimedia content.
- **Why:** It supports high availability, redundancy, and easy integration with Azure services.

## 3. Networking Service: Content Delivery Network (CDN)
- **Purpose:** Distributes content globally by caching it on strategically placed servers, reducing latency.
- **When to use:** When you need to serve web applications, videos, or files to users across different regions quickly.
- **Why:** Improves performance, reduces load on your origin servers, and enhances user experience.

## 4. Database Service: Azure Managed Postgres
- **Purpose:** Fully managed PostgreSQL database service with automated backups, scaling, and patching.
- **When to use:** For transactional systems, web apps, or analytical workloads needing a relational database with strong consistency and ACID properties.
- **Why:** Reduces operational overhead while offering scalability, high availability, and security.

## 5. Password Management: Azure Key Vault
- **Purpose:** Securely stores secrets, certificates, API keys, and passwords.
- **When to use:** When you need to manage sensitive information and control access through permissions.
- **Why:** Ensures encryption and controlled access, reducing the risk of credential exposure.

## 6. Logs Monitor: Azure Monitor
- **Purpose:** Provides full observability into your applications and infrastructure with metrics, logs, and alerts.
- **When to use:** When you need to track system health, diagnose issues, and monitor performance.
- **Why:** Ensures visibility into your environment for proactive troubleshooting and optimization.

## 7. Docker Images: Azure Container Registry (ACR)
- **Purpose:** Stores and manages Docker images, OCI artifacts, and Kubernetes deployments.
- **When to use:** When building and deploying containerized applications.
- **Why:** Provides a secure, scalable registry close to your deployment environment in Azure.

## 8. Security: Application Gateway
- **Purpose:** Acts as a layer 7 load balancer with security features like Web Application Firewall (WAF).
- **When to use:** When you need secure, scalable traffic distribution and protection from common web threats.
- **Why:** Ensures your applications are resilient, performant, and protected from attacks like SQL injection or XSS.
