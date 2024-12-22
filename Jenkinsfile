pipeline {

    agent any
    environment {
        IMAGE_NAME = 'valador/django-jenkins-test'
        IMAGE_TAG = 'v1.0'
    }

    stages {
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