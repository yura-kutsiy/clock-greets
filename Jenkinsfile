
pipeline {
    agent {
    label "default"
    }
    options {
        ansiColor('xterm')
    }
        stages {
            stage('Setup tools') {
                // agent {
                // label "default"
                // }
                steps {
                    echo '\033[34m- - -Config Pipeline- - -\033[0m'
                    sh '''
                        node --version
                    '''
                }
            }
            stage('Build') {
                // agent {
                // label "python"
                // }
                steps {
                    echo '\033[34m- - - Build App - - -\033[0m'
                    sh '''
                    npm i -g @angular/cli
                    ng build
                    '''
                    container('docker') {
                    sh 'docker version'
                    }
                }
            }
            stage('Test') {
                steps {
                    echo 'Testing.....'
                    echo '\033[34mHello\033[0m \033[33mcolorful\033[0m \033[35mtesting!\033[0m'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying....'
                }
            }
        }
    }