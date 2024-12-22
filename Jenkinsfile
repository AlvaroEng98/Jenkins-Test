pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = 'dockerhub_credentials' // ID de las credenciales
        IMAGE_NAME = ''
        IMAGE_TAG = 'v1.0'
    }

    stages {

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Iniciar sesión en Docker Hub usando las credenciales almacenadas en Jenkins
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh """
                            echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        """
                    }
                    env.IMAGE_NAME = "${DOCKER_USERNAME}/django-jenkins-test"
                }
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Construyendo la imagen'
                sh "docker build -t ${env.IMAGE_NAME}:${env.IMAGE_TAG} ."
            }
        }

        stage('Push') {
            steps {
                echo 'Enviando la imagen'
                sh "docker push ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
            }
        }
    }

    post {
        success {
            echo 'La imagen se ha construido y enviado correctamente'
        }
        failure {
            echo 'Ha ocurrido un error al construir o enviar la imagen'
        }
    }
}
