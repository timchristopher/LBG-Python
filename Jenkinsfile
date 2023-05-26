pipeline {
    agent any
   
    parameters {
        booleanParam(name: 'skip_run', defaultValue: false, description: 'Set to false to run the application')
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
            when { expression { params.skip_run != true } }
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
