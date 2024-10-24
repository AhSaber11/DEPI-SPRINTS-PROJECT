# DEPI-SPRINTS-PROJECT
Project Overview
This project demonstrates the creation of a fully automated CI/CD pipeline for deploying applications on a Kubernetes cluster (EKS) using Jenkins on AWS. The infrastructure is provisioned using Terraform, while Ansible is used to configure Jenkins and manage other services.

Tools and Technologies
AWS: Infrastructure setup (VPC, EC2, EKS, CloudWatch).
Terraform: Infrastructure as code for automating AWS resources.
Ansible: Configuration management for Jenkins and Nexus.
Kubernetes: Orchestrating containerized applications using EKS.
Jenkins: CI/CD server for automated builds and deployments.
Nexus: Repository manager for Docker images and other artifacts.
GitHub: Version control and webhooks for automated pipelines.
CloudWatch: Monitoring and alerting for AWS resources.
Project Tasks
Infrastructure Setup:

Created an EKS cluster with two nodes using Terraform.
Set up an EC2 instance to host Jenkins.
Configured AWS networking and security groups.
Set up CloudWatch alarms to monitor EC2 and EKS resources.

Jenkins Configuration:

Installed Jenkins on EC2 using Ansible.
Configured Jenkins pipelines to trigger builds from GitHub pushes.
Integrated with Docker, Kubernetes, and Nexus for deployments.
Artifact Management:

Deployed Nexus as a pod on EKS.
Configured Nexus to manage Docker images and Kubernetes manifests.
Kubernetes Deployment:

Deployed applications using Kubernetes manifests, Helm charts, and Ingress via NGINX.
Monitored and managed the deployment lifecycle using Jenkins pipelines.
How to Run This Project

Clone the repository:


git clone https://github.com/AhSaber11/DEPI-SPRINTS-PROJECT.git

Install Terraform and Ansible.

Set up AWS credentials.

Initialize Terraform and apply the infrastructure:

terraform init
terraform apply

Run Ansible playbooks to configure Jenkins and Nexus:

ansible-playbook jenkins-setup.yml
ansible-playbook nexus-setup.yml
Configure Jenkins pipelines for CI/CD.

Monitoring and Alerting
CloudWatch alarms are set to monitor CPU and memory utilization.
Notifications will be sent via AWS SNS when thresholds are exceeded.
Challenges Faced
Configuring EKS networking and ensuring pod communication across nodes.
Automating Jenkins setup and plugin installation with Ansible.
Future Enhancements
Integrate Prometheus and Grafana for more detailed monitoring.
Automate deployment of additional microservices on EKS.
