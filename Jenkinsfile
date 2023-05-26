pipeline {
    agent any
   
    parameters {
        booleanParam(name: 'run_app', defaultValue: true, description: 'Set to true to run the application')
    }

    environment {
        PORT = "5005"
        PYTHON_HOST = "0.0.0.0"
    }

    stages {
        stage('Pre-build Cleanup') {
            steps {
                echo 'Clean-up'
                // sh 'docker system prune -f'

                sh '''#!/bin/bash
                docker-compose down
                '''
            }
        }
        stage('Build') {
            steps {
                echo 'Build'
                sh '''
                docker-compose build
                '''
            }
        }
        stage('Run') {
            when { expression { params.run_app == true } }
            steps {
                echo 'Run'
                sh '''
                docker-compose up -d
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
                sh 'python3 lbg.test.py'
            }
        }
    }

}
