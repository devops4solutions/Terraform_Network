
pipeline {
    agent any
     
    stages {
      stage('checkout') {
          steps {
                git url: 'git@github.com:cyDaptiv/terraform_network.git'
             
          }
        }
  stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'terraform --version'
               
               
            }
        }
        
         stage('Provision infrastructure') {
             
            steps {
                sh 'terraform init'
                sh 'terraform plan -out=plan'
                sh 'terraform apply plan'
              
             
            }
        }
        
      
      
    }
}
