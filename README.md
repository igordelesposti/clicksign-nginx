# Clicksign-nginx-web

# Terraform AWS Infrastructure

This repository contains a Terraform configuration that launches EC2 instance with Nginx-web.

## Project Structure and File Description

```
project
│   *README.md
└───files
    │   *userdata.tpl --> Script to install Docker and Nginx Image
│   *provider.tf         --> AWS Provider and Key Pair
│   *main.tf             --> EC2 instances and ec2 security group
│   *main_lb.tf          --> Classic Elastic Load Balancer and elb security group
│   *vpc.tf              --> VPC and Subnets
│   *variables.tf        --> Defines variables
│   *locals.tf           --> Named values which can be assigned and used in your code.

```

## Expectations

When terraform configuration is applied, a VPC is created along with public and private subnets and each subnet will have an EC2 instance that will provision a Nginx Docker container.

## How to use

### Requirements

To use terraform configuration, make sure you have the following:

- An AWS account
- AWS CLI installed
- Terraform installed
- keypair created (to ssh into instances)

### Credentials and Setting Variables

To start, create and put all necessary variables in `terraform.tfvars` and if necessary, `variables.tf`.

#### Example:

Access key and secret key are provided from your AWS account

```
access_key = "ACCESS_KEY"
```

### Launch Infrastructure

Run these terraform commands to launch the insfrastructure based on the configuration provided

```
$ terraform init
$ terraform plan
$ terraform apply
```

### Destroy Infrastructure

Run this terraform command to destroy the insfrastructure

```
$ terraform destroy
```

## Installation References

- [Terraform](https://www.terraform.io/intro/getting-started/install.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
