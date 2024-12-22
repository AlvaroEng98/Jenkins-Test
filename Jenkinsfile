pipeline {
    agent any

    environment {
        GIT_VERSION = ''
        DOCKER_VERSION = ''
    }

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
                    echo "Versión de Git:"
                    sh 'git -v'

                    // Imprimir la versión de Docker
                    echo "Versión de Docker:"
                    sh 'docker -v'
                }
            }
        }
    }

    post {
        success {
            script {
                // Enviar correo en caso de éxito
                mail to: 'alvaro@grancaribe.gca.tur.cu',
                     subject: 'Pipeline Completo - Éxito',
                     body: "El pipeline se completó exitosamente.\n\nLa versión de Git es: ${env.GIT_VERSION}\nLa versión de Docker es: ${env.DOCKER_VERSION}"
            }
        }
        failure {
            script {
                // Enviar correo en caso de fallo
                mail to: 'alvaro@grancaribe.gca.tur.cu',
                     subject: 'Pipeline Fallido',
                     body: "El pipeline ha fallado.\n\nPor favor, revisa los logs para más detalles."
            }
        }
    }
}
