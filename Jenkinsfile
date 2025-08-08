pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/shaiksaleemafroz/terraform-scripts.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([file(credentialsId: 'gcp-service-account', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh '''
                      export GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS}
                      terraform init
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([file(credentialsId: 'gcp-service-account', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh '''
                      export GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS}
                      terraform plan
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([file(credentialsId: 'gcp-service-account', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh '''
                      export GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS}
                      terraform apply -auto-approve
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        success {
            echo 'Deployment Successful'
        }
        failure {
            echo 'Deployment Failed'
        }
    }
}
