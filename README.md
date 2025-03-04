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

├── terraform/ # Terraform configuration files
│ ├── main.tf # Main Terraform configuration
│ ├── variables.tf # Input variables for Terraform
│ └── outputs.tf # Outputs (e.g., EC2 instance IPs)
├── ansible/ # Ansible configuration files
│ ├── inventory # Static inventory file
│ ├── aws_ec2.yml # Dynamic inventory configuration
│ └── playbook.yml # Ansible playbook for configuring EC2 instances
├── README.md # Project documentation (you are here!)
└── .gitignore # Files to ignore in Git

---

## **Usage**

### **1. Provision Infrastructure with Terraform**

1. Navigate to the `terraform/` directory:
   ```bash
   cd terraform
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Preview the changes:
   ```bash
   terraform plan
   ```
4. Apply the changes to provision the infrastructure:
   ```bash
   terraform apply
   ```
5. After provisioning, Terraform will output the public IP addresses of the EC2 instances. These will be used in the Ansible inventory.

### **2. Configure Infrastructure with Ansible**

#### **Using Static Inventory**

1.  Update the `ansible/inventory` file with the public IP addresses of your EC2 instances:

```ini
  [webservers]
  public-ip-address ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/your-key.pem
```

2.  Run the Ansible playbook:

```bash
  ansible-playbook -i ansible/inventory ansible/playbook.yml
```

#### **Using Dynamic Inventory**

1.  Ensure your AWS credentials are configured (e.g., using `aws configure`).

2.  Run the Ansible playbook with the dynamic inventory:

```bash
  ansible-playbook -i ansible/aws_ec2.yml ansible/playbook.yml
```

---

### **3. Destroy Infrastructure (Optional)**

When you're done, destroy the infrastructure to avoid unnecessary AWS charges:

```bash
  terraform destroy
```

---

## **Dynamic Inventory Configuration**

The dynamic inventory script (`aws_ec2.yml`) uses the `aws_ec2` plugin to fetch EC2 instance details from AWS. It groups instances by tags and uses their public IP addresses for connectivity.

Example `aws_ec2.yml`:

```yaml
plugin: aws_ec2
regions:
  - us-east-1
keyed_groups:
  - key: tags.Name
    prefix: tag
hostnames:
  - public-ip-address
filters:
  instance-state-name: running
```

---

## **Contributing**

Contributions are welcome! If you find any issues or have suggestions for improvement, please open an issue or submit a pull request.

---

## **Acknowledgments**

- [Terraform Documentation](https://www.terraform.io/docs)

- [Ansible Documentation](https://docs.ansible.com/)

- [AWS EC2 Dynamic Inventory Guide](https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html)

---

## **Author**

- **Ali Abdelmaqsoud**

  - GitHub: [Ali-Abdelmaqsoud](https://github.com/Ali-Abdelmaqsoud)

  - LinkedIn: [Ali Abdelmaqsoud](https://www.linkedin.com/in/ali-abdelmaqsoud-237479288/)

  - Email: [ali.abdelmaqsoud23@gmail.com](https://mailto:ali.abdelmaqsoud23@gmail.com/)

---

## **Questions?**

If you have any questions or need help, feel free to reach out! 😊
