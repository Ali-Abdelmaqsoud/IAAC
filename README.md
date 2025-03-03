# **Infrastructure as Code (IaC) with Terraform and Ansible**

This project demonstrates how to provision and configure AWS infrastructure using **Terraform** and manage it with **Ansible**. It includes both **static** and **dynamic inventory** setups for Ansible, making it flexible for different use cases.

---

## **Project Overview**

The project consists of two main components:

1. **Terraform**: Automates the provisioning of AWS resources (e.g., EC2 instances, VPC, subnets, security groups).
2. **Ansible**: Configures the provisioned EC2 instances (e.g., installing and managing software like Nginx).

The project supports:

- **Static Inventory**: Manually defined list of hosts in an inventory file.
- **Dynamic Inventory**: Automatically fetches EC2 instance details from AWS using the `aws_ec2` plugin.

---

## **Features**

- **Terraform**:

  - Provisions EC2 instances in a custom VPC.
  - Configures security groups to allow SSH and HTTP traffic.
  - Outputs instance details (e.g., public IP) for use in Ansible.

- **Ansible**:
  - Supports both **static** and **dynamic inventory**.
  - Installs and configures Nginx on the EC2 instances.
  - Demonstrates how to use Ansible roles and playbooks.

---

## **Prerequisites**

Before using this project, ensure you have the following installed and configured:

1. **Terraform**: [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. **Ansible**: [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
3. **AWS CLI**: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
4. **AWS Credentials**: Configure your AWS credentials using `aws configure` or environment variables.
5. **SSH Key**: Ensure you have an SSH key pair in AWS and the private key available locally.

---

## **Project Structure**
