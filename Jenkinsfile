pipeline {

    agent any
    environment {

        DOCKER_ID = credentials('1') // ID de las credenciales
        DOCKER_PASSWORD = credentials('1') // ID de las credenciales


        IMAGE_NAME = 'valador/django-jenkins-test'
        IMAGE_TAG = 'v1.0'
    }

    stages {
        stage('Docker login ') {
            steps {
                script {
                    // Imprimir el nombre de usuario
                    echo "El nombre de usuario de Docker Hub es: ${DOCKER_ID}"
                }
            }
        }
        stage('Build') {
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