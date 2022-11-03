
pipeline {
    agent { label 'kaniko' }
    // triggers {
    //     cron('H 4/* 0 0 1-5')
    // }
    options {
        ansiColor('xterm')
        timestamps ()
        buildDiscarder(logRotator(numToKeepStr: '10'))
        // skipDefaultCheckout true
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerCred')
        def dockerRegistry = "yurasdockers";
        def dashboardName = "dashboard";
        def dashboardCache= "${dashboardName}-cache"
        def dashboardTag = "0.2-clck"
    }
        stages {
                // the code here can access $pass and $user
            stage('Build') { 
                steps { 
                withCredentials([file(credentialsId: 'config.json', variable: 'FILE')]) {
                    // sh 'use $FILE'
                    container('kaniko') {
                        script {
                            sh '''
                                cat $FILE > /kaniko/.docker/config.json
                                /kaniko/executor --context `pwd` \
                                                 --snapshotMode=full \
                                                 --cache=true \
                                                 --cache-repo ${dockerRegistry}/${dashboardCache} \
                                                 --destination ${dockerRegistry}/${dashboardName}:${dashboardTag}
                            '''
                        }
                    }
                }           
                }
            }
        stage('Test'){
            steps {
                sh 'echo "testing will be here"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps"'
            }
        }
    }
}