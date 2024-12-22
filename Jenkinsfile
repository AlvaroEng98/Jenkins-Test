pipeline {

    agent any
    environment {

        DOCKER_ID = credentials('dockerhub_credentials') // ID de las credenciales
        DOCKER_PASSWORD = credentials('dockerhub_credentials') // ID de las credenciales


        IMAGE_NAME = 'valador/django-jenkins-test'
        IMAGE_TAG = 'v1.0'
    }

    stages {

        stage('Docker Login') {
            steps {
                echo 'Iniciando sesión en Docker Hub'
                script {
                    sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin"
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