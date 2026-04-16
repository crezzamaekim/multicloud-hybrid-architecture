# Hybrid Cloud Architecture Project
**Created by:** Crezza  
**Role:** Software Engineering Cloud Intern

---

## 🚀 Project Overview
This project showcases a functional **Hybrid Cloud Architecture**. It integrates a private cloud environment (OpenStack) with public cloud storage solutions (AWS S3/LocalStack and Google Drive) to demonstrate automated provisioning and cross-cloud data portability.

## 🏗️ Architecture Components
- **Private Cloud Compute:** OpenStack (MicroStack) for secure instance hosting.
- **Simulated Public Storage:** LocalStack (S3) acting as the primary cloud data store.
- **External Public Cloud:** Google Drive integration for disaster recovery.
- **Infrastructure as Code (IaC):** Terraform for multi-provider orchestration.
- **Data Orchestration:** rclone for storage interoperability and synchronization.

## 🛠️ How to Run
1. **Provision Infrastructure:**
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```
2. **Execute Data Sync:**
   ```bash
   ./scripts/sync_data.sh
   ```

## 📂 Deliverables & Project Structure
- **/terraform**: Contains `main.tf` for multi-cloud provisioning.
- **/data**: Source files used for the migration demo.
- **/scripts**: Shell scripts for automating `rclone` workflows.
- **/logs**: `sync_results.txt` proving successful data migration and integrity.
- **/diagrams**: Architectural visualization of the hybrid setup.

## ✅ Key Achievements
- Resolved **S3 Path-Style** routing issues in LocalStack.
- Successfully implemented **Headless OAuth2** authentication for Google Drive.
- Achieved zero-data-loss synchronization across three different storage protocols (Local FS, S3, and Google Drive).

## ✅ Data Integrity & Verification
To ensure zero-data-loss during the hybrid cloud migration, I performed an MD5 checksum verification between the S3 source and the Google Drive destination.

- **Verification Log:** [View Integrity Check](./logs/integrity_check.txt)
- **Status:** 100% Match (No differences found)
