pipeline {
    agent any

    environment {
        BOT_TOKEN = credentials('telegram-bot-token')
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                   sh 'make build'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    
                        sh 'make tests'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    
                    sh 'make deploy'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }

        // success {
        //     echo 'This will run only if successful'
        //     emailext body: 'A Succes Test Email'. recipientProviders:
        //     [[$class: 'DeveloppersRecipientProvider'],
        //      [$class: 'RequesterRecipientProvider']], subject: 'Test'
        // }
        // success {
        //     echo 'A failed Test'
        //     emailext body: 'A Failed Test Email'. recipientProviders:
        //     [[$class: 'DeveloppersRecipientProvider'],
        //      [$class: 'RequesterRecipientProvider']], subject: 'Test'
        // }
        // unstable {
        //     echo 'This will run only if the run was marked as unstable'
        // }
        // unstable {
        //     echo 'This will run only if the pipeline has changed'
        // }
        
    }
        
}
