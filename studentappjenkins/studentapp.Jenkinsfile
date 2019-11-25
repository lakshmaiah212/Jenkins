properties([parameters([choice(choices: 'master\nfeature-1\nfeature-2', description: '', name: 'branch')])])
currentBuild.displayName = "studentapp-#"+currentBuild.number
pipeline{
    agent any
    environment{
        nexusURL = "3.82.160.227"
        nexus_cred = credentials('Nexuscred')
    }
    stages{
        stage('SCM Checkout'){
            steps{
                git url: 'https://github.com/lakshmaiah212/myproject.git' , branch:"${params.branch}"
            }
        }
        stage('maven compile'){
            steps{
                sh 'mvn clean compile'
            }
        }
        stage('maven deploy'){
            steps{
                sh 'mvn package'
            }
        }
        stage('Upload snapshot artifact'){
            steps{
                sh '''
                  mvn -s settings.xml  deploy -DnexusURL=${nexusURL} -DDEPLOYMENT_ID=deployment  -DNEXUS_USERNAME=${nexus_cred_USR} -DNEXUS_PASSWORD=${nexus_cred_PSW}
                '''

            }
        }
    }
}