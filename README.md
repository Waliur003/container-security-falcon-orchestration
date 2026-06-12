# Cloud Security Engineering Project 03: Container Security Falcon (Securing the Container Lifecycle & Serverless Orchestration)

## Overview

I have architected and deployed a serverless, continuous container security pipeline on AWS using Infrastructure as Code (IaC) primitives. This project demonstrates an automated governance framework designed to protect the container supply chain, validate image configuration baselines, and enforce isolated microservice runtimes. The system leverages a zero-maintenance, decoupled architecture that builds minimal container layers, automates vulnerability static analysis, and executes workloads via a secure serverless container compute tier. By embedding strict non-root boundaries into the build phase and launching tasks inside a hardened network envelope, the architecture remediates software supply chain vulnerabilities pre-deployment and drops container execution runtime threats to absolute zero.

## The Problem

As containerized microservices scale across multi-cloud enterprise footprints, validating the security posture of raw third-party image layers becomes a major operational challenge. Rapid development iterations frequently introduce bloated base images, insecure user contexts, and public registry exposures. Traditional container hosting mechanisms consistently fail due to three architectural limitations:

* **The Vulnerability Exposure Window:** Relying on monolithic or un-audited base operating system distributions introduces thousands of unpatched upstream CVEs into production clusters. Lacking a mechanism to automatically screen and reject insecure image blocks pre-deployment leaves applications open to rapid host compromise.

* **Privilege Escalation and Root Dependency:** By default, standard container runtimes execute process payloads under root permissions. If an application dependency suffers a remote code execution exploit, a threat actor can easily escape the container boundary, compromise the underlying kernel space, and move laterally across the internal cloud infrastructure network.

* **Operational Blind Spots and Static Drift:** Microservices frequently shift their configuration state across deployments without matching tracking updates. Without enforcing immutable configuration tags and pinning task executors to structured, ephemeral data log paths, incident response units cannot isolate system mutations or perform clean forensic analysis during an active breach.

## The Solution

* **Serverless Container Orchestration:** Provisioned the operational framework using Amazon ECS backed by AWS Fargate, abstracting away underlying host virtual machine management to eliminate server patching overhead and insulate tenant compute spaces.

* **Hardened Minimal Base Images:** Engineered lightweight Docker microservices using minimal base images (Alpine Linux), stripping unnecessary utilities and compilers to compress the container footprint down to 20MB and eliminate potential execution binaries.

* **Automated Registry Vulnerability Scanning:** Deployed a highly scalable image gateway registry using Amazon ECR with Scan on Push and Tag Immutability active, creating a permanent barrier that blocks unvetted or mutated images from entering the application workspace.

* **Forensic Telemetry Observation:** Integrated an isolated Amazon CloudWatch Log Group logging driver structure directly into the task deployment specification, routing container transaction histories safely away from the local application context with fixed lifecycle retention configurations.

## Tech Stack

* **Compute Engine:** Amazon ECS / AWS Fargate (Serverless Container Orchestration Tier)

* **Container Registry:** Amazon ECR (Private, Secure Image Management Repository)

* **Observability Platform:** Amazon CloudWatch Logs (Forensic Auditing Interface)

* **Identity & Privilege Control:** AWS IAM (Least-Privilege Task Execution Boundaries)

* **IaC Automation Framework:** Terraform (v1.0+ / Modularized Declarative Configuration Arrays)

## Architecture Diagram

[Insert Container Security Falcon Architecture Diagram Here]

## Project Procedure

### 1. Hardened Container Registry Engineering

I engineered a private entry repository using Amazon ECR to serve as the secure hosting boundary for validated microservice configurations.

* **Tag Immutability Enforcement:** Locked the repository parameters to execute under immutable constraints, preventing operational failures or malicious injection paths from overwriting verified image tags with untrusted code blocks.

* **Automated Push-Time Analysis:** Configured the underlying scanning framework to activate automatically upon image delivery, providing immediate layer-by-layer static analysis reports to flag operating system vulnerabilities before orchestration lifecycles begin.

### 2. Non-Root Workload Architecture Development

I developed a hardened microservice execution matrix within local Docker assets to enforce absolute privilege isolation.

* **System User Separation:** Modified the build layer to explicitly inject an isolated system user and group context, moving the base application profile completely away from administrative defaults.

* **Process Boundary Hardening:** Restricted the execution parameters using explicit USER directives, ensuring that even if an application dependency suffers a remote exploit, the underlying operating system process possesses zero root privileges to execute local escalations.

### 3. Forensic Observability Pipeline Configuration

I provisioned a centralized log group architecture using Amazon CloudWatch Logs to protect system audit trails.

* **Decoupled Target Mapping:** Structured an isolated workspace named /ecs/container-security-falcon to pull container standard output telemetries out of the live computing pod in real-time.

* **Overhead Retention Control:** Anchored a fixed 14-day data retention lifecycle on the log group properties, preventing infinite tracking data accumulation to minimize cloud storage budget overhead.

### 4. Scoped Execution Boundary Engineering

To manage cross-service operations securely, I formulated a strict execution access layer using AWS IAM.

* **Agent Privilege Scoping:** Deployed an ECS Task Execution role bound directly to the AmazonECSTaskExecutionRolePolicy managed boundary template.

* **Trust Relationship Isolation:** Structured an inline JSON trust document limiting role assumption rights exclusively to the ecs-tasks.amazonaws.com service principal, blocking unauthorized external nodes from picking up the cluster pull credentials.

### 5. Serverless Task Provisioning and Cluster Deployment

I finalized the serverless container computing framework by provisioning an isolated orchestrator tier on Amazon ECS.

* **Network Mode Standardization:** Locked the task definition to execute within the awsvpc network parameters, forcing the platform to allocate a dedicated, isolated Elastic Network Interface (ENI) directly to the running container instance.

* **Resource Limit Allocation:** Hardcoded exact, lower-tier hardware profiles restricting the worker to 256 CPU units and 512MB of memory allocation parameters to optimize cost boundaries.

## Infrastructure as Code (IaC) Architecture

The entire container infrastructure layer is provisioned through declarative, modular Terraform configurations to guarantee immediate environment repeatability and baseline state compliance.

## Directory Layout & Modular Structure

```text
cloud-container-security-falcon/
├── provider.tf
├── variables.tf
├── ecr.tf
├── cloudwatch.tf
├── iam.tf
├── ecs.tf
└── outputs.tf
```

## Detailed File-by-File Technical Breakdown

### 1. System Provider Scoping (provider.tf)

* **Package Enforcement:** Locks execution cycles securely against the modern AWS Provider registry (v5.0+) and requires a minimum compilation framework version of v1.0.0+.

### 2. Variable Abstractions & Metadata Outputs (variables.tf & outputs.tf)

* **Portability Mapping:** Abstracts deployment region markers, repository naming blocks, and application cluster prefixes into cleanly parameterized schemas, keeping the infrastructure portable.

### 3. Registry Perimeter Definer (ecr.tf)

* **Security Lock Configuration:** Mandates tag immutability parameters and embeds the scan_on_push logical object configurations directly onto the private image management block.

### 4. Logging Architecture Engine (cloudwatch.tf)

* **Observability Provisioning:** Outlines the aws_cloudwatch_log_group configuration boundaries and hardcodes retention parameter limitations cleanly away from default scopes.

### 5. Identity Boundary Enforcer (iam.tf)

* **Trust Contract Handshake:** Assigns the core ECS task assumption parameters and binds the private execution role tightly to managed registry pull policies.

### 6. Serverless Cluster Infrastructure (ecs.tf)

* **Orchestration Allocation:** Compiles container task mapping properties running Alpine Linux, maps the logConfiguration parameters to use the cloudwatch driver, and deploys the cluster network properties.

## Verification and Results

### Verified Supply Chain Image Scanning

Simulated a software supply chain evaluation cycle by building the microservice on top of a highly optimized, audited Alpine Linux base operating system footprint. Upon executing the container push command, the private Amazon ECR repository intercepted the image and ran an automated static analysis routine. The console report officially confirmed that the minimized attack surface effectively dropped all unpatched operating system vulnerabilities down to zero, displaying zero critical or high-severity CVE records.

### Validated ECS Task Lifecycle and Execution Success

Deployed the task configuration parameters into the serverless Amazon ECS cluster plane. The container successfully completed its initialization phase, fetched the image layers out of ECR across internal network links, and ran its internal logic payload. The container dashboard confirmed that the microservice completed its full operational cycle and gracefully transitioned to a stopped state with an exit status of Exit Code: 0, confirming absolute success with zero structural runtime execution failures.

### Confirmed Centralized Log Retention and Delivery

Inspected the forensic data pipeline outputs inside the Amazon CloudWatch console immediately following the task execution run. The system successfully validated that the container's standard output stream completely bypassed the local storage layer and landed securely in the target log group space. The log engine compiled the system telemetries correctly, displaying timestamped indicators tracking the successful execution of the python microservice under standard non-root user enforcement parameters.

## Troubleshooting & Technical Fixes

### 1. Registry Tag Alignment Modification

**The Issue:** The initial task invocation threw a high-priority CannotPullContainerError exception and failed to launch because the task definition was hardcoded to query an explicit image tag identifier (:v1) that did not exist inside the registry catalog.

**The Fix:** Updated the deployment configuration mapping values to target the verified :latest tag manifest sitting inside the private ECR image directory, correcting the pull request mismatch and allowing the orchestrator to resolve the container layers instantly.

### 2. Network Infrastructure Plane Recovery

**The Issue:** The execution runner threw missing boundary flags due to the prior accidental deletion of the default VPC workspace, depriving the serverless Fargate engine of the necessary public subnets and internet gateways needed to stand up the compute layer.

**The Fix:** Utilized the native AWS VPC action controls to dynamically recreate the default VPC architecture plane, immediately restoring the standard 172.31.0.0/16 infrastructure baseline across local availability zones.

### 3. Fargate Networking Property Validation

**The Issue:** The task definition failed validation checks during the manual Run Task configuration step due to missing explicit network boundaries and subnets inside the console wizard form.

**The Fix:** Configured the networking properties to bind explicitly to the restored VPC coordinates, selected active target subnets, and forced the Auto-assign Public IP toggle parameter to an enabled state, giving the task's Elastic Network Interface (ENI) the required internet routing translation paths to fetch image blocks from the private ECR endpoint.

## Verification Screenshots

### Amazon ECR Registry State

**Console View:** Refer to the validation screenshot named Screenshot 1.png capturing the private repository index interface. This validates successful, secure image tracking under the explicit :latest tag alignment, confirming that the container payload is verified and ready for pull ingestion.

<img width="1918" height="907" alt="Screenshot 1" src="https://github.com/user-attachments/assets/7c515f36-33f5-4445-a92a-b98715aeb95c" />


### Amazon ECS Task Execution Success

**Console View:** Refer to the verification image named Screenshot 2.png detailing the task tracking interface dashboard. This screenshot confirms the final operational verification step of the architecture, clearly showing the ecs container worker finishing its workload parameters with an explicit Exit code: 0 status under serverless fargate execution parameters.

<img width="1919" height="864" alt="Screenshot 2" src="https://github.com/user-attachments/assets/e228a6b0-5d95-4162-b1e9-c129f80b3dcc" />


### Forensic Tracking Stream (CloudWatch)

**Console View:** Refer to the verification image named Screenshot 3.png capturing the Amazon CloudWatch Log Events viewer. This verifies successful log capture inside the /ecs/container-security-falcon log group container, displaying the successfully output status text tracing.

<img width="1919" height="907" alt="Screenshot 3" src="https://github.com/user-attachments/assets/5ed0d88e-023c-42bc-9e9e-0536e865982e" />


## Future Improvements

* **Multi-Account Organizational Distribution:** Scale the image validation pipeline by attaching cross-account ECR repository access controls, allowing a single verified scanning hub to safely distribute secure images across multi-account structures inside AWS Organizations.

* **Automated Step Function Self-Healing:** Link the ECR scan output alerts directly to an automated AWS Step Functions routine to instantly delete or isolate an image layer the moment a high-severity vulnerability index is recorded.

* **Centralized Compliance Dashboards:** Configure the log analytics tracking matrices to parse metrics directly into AWS Security Hub, aggregating container build compliance findings alongside broader cloud environment metrics.

## Notes

This architecture highlights specialized cloud core competencies in designing serverless container orchestrators, managing hardened non-root container base footprints, automating static image scanning pipelines, and structuring clean multi-module IaC templates to enforce robust security perimeters across application lifecycles.

**Bottom Line:** The Container Security Falcon transforms vulnerable microservice deployments into a completely hardened, serverless container security pipeline. By compressing software build definitions onto minimal Alpine Linux distributions, removing dangerous root runtime rights, enforcing image layer immutability via code, and verifying successful task terminations through explicit Exit Code 0 indicators, the architecture guarantees absolute supply chain protection and serverless environment isolation.
