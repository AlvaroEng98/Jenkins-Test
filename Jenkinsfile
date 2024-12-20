pipeline {

    agent any

    stages {
        stage('Inicializar') {
            steps {
                echo 'Inizializando el Proyecto'
            }
        }
        stage('Build') {
            steps {
                echo('Construyendo el proyecto')
                sh 'docker build -t my-django-app:test1 .'
            }
        }
        stage('Montar') {
            steps {
                echo('Desplegando el proyecto')
                sh 'docker run -p 8000:8000 my-django-app:test1'
            }
        }

    }
    post {
        success {
            mail to: 'alvaro@grancaribe.gca.tur.cu',
                 subject: "Pipeline exitoso: ",
                 body: "El pipeline se ejecutó exitosamente."
        }
        failure {
            mail to: 'alvaro@grancaribe.gca.tur.cu',
                 subject: "Pipeline fallido}",
                 body: "El pipeline ha fallado."
        }
    }

}