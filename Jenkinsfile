pipeline {
    agent any

    stages {
        stage('Inicializar') {
            steps {
                echo 'Inicializando el Proyecto'
            }
        }

        stage('Verificar Versiones') {
            steps {
                script {
                    // Imprimir la versión de Git
                    sh 'git --version'
                    // Imprimir la versión de Docker
                    sh 'docker --version'
                }
            }
        }
    }
}
