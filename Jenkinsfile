pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/aneeshpalecherla/terraform-ec2-deploy.git'
            }
        }
        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                bat """
                terraform plan ^
                    -var "aws_access_key=%AWS_ACCESS_KEY_ID%" ^
                    -var "aws_secret_key=%AWS_SECRET_ACCESS_KEY%"
                """
            }
        }
        stage('Terraform Apply') {
            steps {
                input "Approve apply?"
                bat """
                terraform apply -auto-approve ^
                    -var "aws_access_key=%AWS_ACCESS_KEY_ID%" ^
                    -var "aws_secret_key=%AWS_SECRET_ACCESS_KEY%"
                """
            }
        }
    }
}
