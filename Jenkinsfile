pipeline {

    agent any
    environment {

        DOCKER_HUB_CREDENTIALS  = 'dockerhub_credentials' // ID de las credenciales


        IMAGE_TAG = 'v1.0'
    }

    stages {

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Iniciar sesión en Docker Hub usando las credenciales almacenadas en Jenkins
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        env.IMAGE_NAME = "${DOCKER_USERNAME}/django-jenkins-test"

                        // Usar --password-stdin para evitar pasar la contraseña en la línea de comandos
                        sh """
                            echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        """
                    }
                    // Asignar el nombre de la imagen usando el nombre de usuario
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