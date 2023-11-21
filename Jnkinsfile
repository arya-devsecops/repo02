parameters([choice(name: 'action' , choices: ['Plan' , 'Apply' , 'Destroy'] , description: 'select the action')])
pipeline {
    agent any
options {
  ansiColor('xterm')
    }
    environment {
        ARM_CLIENT_ID         = "b90f940f-e258-4200-906e-55e1f693b73f"
        ARM_CLIENT_SECRET     = "tnY8Q~TJVyOMPnN0ZnTDm.zK9P5b3sQL1K1msb4V"
        ARM_SUBSCRIPTION_ID   = "44072bee-09d8-4fd1-9150-46a2662697d7"
        ARM_TENANT_ID         = "3cc22669-453b-4e89-8eb5-29528e2c8a69"
        }
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'repo', url: 'https://github.com/Arya5596/repo01']])
                
            }
        }
          stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('terraform format check') {
            steps{
                script {
                    sh 'terraform fmt'
                }
            }
        }
        stage('terraform validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }    
        stage('Terraform Plan') {
            steps {
                script {
                    // terraform plan output saved in plan.output file
                        sh 'terraform plan -out=plan.out'
                }
            }
        }
       stage('Conditional Terraform Apply') {
     when {
        expression {
            // Only apply if the plan was successful
                return currentBuild.resultIsBetterOrEqualTo('SUCCESS')
        }
    }
        steps {
            script {
                timeout(time: 1,unit: 'MINUTES'){
                input "Do you want to proceed"
                }
            // Run Terraform apply using the saved plan file
                    sh 'terraform apply "plan.out"'
                }
            }
       }
        stage('Terraform Destroy'){
            steps{
                script {
                    timeout(time: 1,unit: 'MINUTES'){
                    input "Do you want to destroy all resources"
                    }
                    // to destroy the all resource
                    sh 'terraform destroy --auto-approve'
                }
            }
        }
      
    }
}
