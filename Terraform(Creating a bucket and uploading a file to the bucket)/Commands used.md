# Terraform & AWS CLI Commands (with Explanations)

This document explains each command I used in this project and what it does.

---

### `terraform --version`
- Shows the installed Terraform version.  
- Useful to confirm if you’re using the correct version.

### `aws --version`
- Displays the installed AWS CLI version.  
- Ensures the AWS CLI is properly installed.

### `aws configure`
- Configures AWS credentials and settings.  
- Prompts for Access Key, Secret Key, Region, and Output format.

### `terraform init`
- Initializes the Terraform working directory.  
- Downloads provider plugins (like AWS) and sets up the backend.

### `terraform plan`
- Previews what changes Terraform will make to your infrastructure.  
- Does not create or destroy anything, just shows the plan.

### `terraform apply`
- Applies the changes defined in your configuration.  
- Actually creates or updates cloud resources.  

### `aws s3 cp "C:\Users\johnm\OneDrive\Desktop\Tesla-Annual-Report1.pdf" s3://johnmike-2025-project-bucket01/`
- Uploads a file from your local computer to the specified S3 bucket.  
- `cp` means "copy".

### `aws s3 ls`
- Lists all S3 buckets in your AWS account.

### `terraform state list`
- Shows all resources tracked in the current Terraform state file.  
- Helps confirm which resources Terraform is managing.

### `aws s3 ls s3://johnmike-2025-project-bucket01/`
- Lists all files (objects) inside the specified S3 bucket.

### `aws s3 rm s3://johnmike-2025-project-bucket1/Tesla-Annual-Report1.pdf`
- Deletes the specified file from the S3 bucket.

### `terraform destroy`
- Deletes all resources created by Terraform.  
- Cleans up the infrastructure.
