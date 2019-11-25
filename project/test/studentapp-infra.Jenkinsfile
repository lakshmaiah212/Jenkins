pipeline{
    agent any
    environment{
        AWS = credentials('AWS_CRED')
        DB = credentials('DB-CRED-TEST')
    }
    stages{
        stage("clone git repo"){
            steps{
                git clone https://github.com/lakshmaiah212/terraform-jenkins-rds.git
            }
        }
        stage("Create Infra"){
            steps{
                sh '''
                    cd project/test
                    export AWS_ACCESS_KEY_ID="${AWS_USR}"
                    export AWS_SECRET_ACCESS_KEY="${AWS_PSW}"
                    export AWS_DEFAULT_REGION="us-east-1"
                    terraform init
                    terrafrom apply -auto-approve -var DBUSER=${DB_USR} -var DBPASS=${DB_PSW} 

                '''  
            }
        }
    }
} 