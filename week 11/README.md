# Week 11: Multi-Cloud & Hybrid Architectures

A hands-on lab covering multi-cloud and hybrid cloud architecture concepts using OpenStack (MicroStack), Terraform, and rclone.

## Architecture Overview

```
Private Cloud (OpenStack/MicroStack)
        |
        |---- Terraform (Infrastructure as Code)
        |
Public Cloud Storage (AWS/LocalStack - simulated)
        |
        |---- rclone (Data Sync)
```

## Tools Used
- **OpenStack (MicroStack)** – Private cloud platform
- **Terraform** – Infrastructure as Code
- **rclone** – Cloud storage synchronization
- **Multipass** – Ubuntu VM on macOS
- **LocalStack** – AWS cloud simulation

## Lab Structure

```
week11/
├── terraform/
│   ├── main.tf          # OpenStack Terraform config
│   └── aws/
│       └── main.tf      # AWS/LocalStack multi-cloud config
└── storage-sync/
    └── sync.log         # rclone data sync log
```

## Day-by-Day Summary

| Day | Topic | Outcome |
|-----|-------|---------|
| 1 | Environment Setup | Multipass VM, tools installed |
| 2 | Private Cloud (OpenStack) | MicroStack deployed, Horizon dashboard accessed, `private-net` created |
| 3 | Terraform IaC | Deployed `terraform-network` via Terraform |
| 4 | Multi-Cloud Simulation | Terraform configs for OpenStack + AWS (LocalStack) |
| 5 | Storage Sync | rclone sync between local storage providers |
| 6 | Mini Project | Hybrid cloud architecture documented |

## OpenStack Network Setup

```bash
# Create private network
microstack.openstack network create private-net
microstack.openstack subnet create private-subnet \
  --network private-net \
  --subnet-range 10.0.0.0/24

# Verify
microstack.openstack network list
```

## Terraform Deployment

```bash
# Initialize and apply OpenStack configuration
cd terraform/
terraform init
terraform apply

# Result: terraform-network created in OpenStack
```

## rclone Storage Sync

```bash
# Sync local data
rclone sync /data /localbackup --log-file=sync.log --log-level INFO
```

## Learning Outcomes
- ✅ Explain multi-cloud and hybrid cloud architectures
- ✅ Deploy OpenStack private cloud (MicroStack)
- ✅ Automate infrastructure using Terraform
- ✅ Sync data between storage providers using rclone
- ✅ Design a hybrid cloud architecture
