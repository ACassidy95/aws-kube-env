# AWS Kube Env

A set of modules to create a small Kubernetes environment within AWS EKS, reachable from the user's console and easily stood up and destroyed. Made to help me study for my CKAD/CKA qualificiations and host/test personal projects.

# Modules

Terraform modules containing infrastructure required for functioning EKS Cluster.

## Networking

Creates a VPC with private subnets to host K8s cluster nodes, and public subnets with a NAT Gateway and associated Elastic IP. Additionally creates an Internet Gateway and route tables to handle public and private routing.

## Cluster

Creates an EKS Cluster inside a VPC. The Cluster is created with a single default Node Group along with Cluster and Node IAM Roles.

## IAM

Creates the authentication infrastructure required to support RBAC to a Kubernetes Cluster.

# Resources

K8s resources required to run the Cluster.