pipeline {

    agent any
    environment {

        DOCKER_HUB_CREDENTIALS  = 'dockerhub_credentials' // ID de las credenciales


        IMAGE_NAME = 'valador/django-jenkins-test'
        IMAGE_TAG = 'v1.0'
    }

    stages {

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Iniciar sesión en Docker Hub usando las credenciales almacenadas en Jenkins
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }
                }
            }
        }

        stage('Docker Build ') {
            steps {
                echo 'Construyendo la imagen'
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Push') {
            steps {
                echo 'Enviando la imagen'
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
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