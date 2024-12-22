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
                    // Obtener la versión de Git y Docker
                    env.GIT_VERSION = sh(script: 'git --version', returnStdout: true).trim()
                    env.DOCKER_VERSION = sh(script: 'docker --version', returnStdout: true).trim()

                    // Imprimir las versiones
                    echo "Versión de Git: ${env.GIT_VERSION}"
                    echo "Versión de Docker: ${env.DOCKER_VERSION}"
                }
            }
        }
    }

    post {
        success {
            script {
                // Enviar correo en caso de éxito
                mail to: 'destinatario@example.com',
                     subject: 'Pipeline Completo - Éxito',
                     body: "El pipeline se completó exitosamente.\n\nLa versión de Git es: ${env.GIT_VERSION}\nLa versión de Docker es: ${env.DOCKER_VERSION}"
            }
        }
        failure {
            script {
                // Enviar correo en caso de fallo
                mail to: 'destinatario@example.com',
                     subject: 'Pipeline Fallido',
                     body: "El pipeline ha fallado.\n\nPor favor, revisa los logs para más detalles."
            }
        }
    }
}
