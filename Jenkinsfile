pipeline { 
    agent {
        label "pi"
    } 
    options {
        ansiColor('xterm')
    }
    stages {
        // stage('Build') { 
        //     steps { 
        //         container('kaniko') {
        //             script {
        //                 sh '''
        //                     /kaniko/executor --dockerfile `pwd`/Dockerfile \
        //                                      --context `pwd` \
        //                                      --no-push \
        //                                      --cleanup
        //                 '''
        //             }
        //         }
        //     }
        // }
        stage('Build'){
            steps {
                // catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){
                    sh '''
                        docker build -t clock:0.1 .
                    '''
                // }
            }
        }
        stage('Testing'){
            steps {
                sh '''
                    echo "Testing Stage"
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps"'
            }
        }
    }
    post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: true,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    cleanWhenFailure: true,
                    cleanWhenSuccess: true)
        }
    }
}