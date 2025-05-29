# Deploying AWS Resources using Terraform module with GitActions
![image](https://github.com/user-attachments/assets/ce920039-ebfc-4941-91b9-3c05a4133d5a)


# Check gitaction file for execution steps  

name: 'Terraform CI/CD'

on:
 workflow_dispatch

jobs:
  terraform:
    name: 'Terraform'
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: environments/dev

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.6.6

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1
      - name: Reconfigure Terraform
        run : terraform init -reconfigure
      - name: Initialize Terraform
        run: terraform init -migrate-state

      - name: Validate Terraform
        run: terraform validate

      - name: Plan Terraform
        run: terraform plan

      - name: Apply Terraform
      # if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        run: terraform apply -auto-approve   

        ![image](https://github.com/user-attachments/assets/32d0c389-a8a6-4caa-a2d5-cafd2b10b756)


![image](https://github.com/user-attachments/assets/71e76b8b-ea14-407d-ad5b-c86897cddade)
