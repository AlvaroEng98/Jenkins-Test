pipeline {

    agent any

    stages {
        stage('Construir') {
            steps {
                echo 'Construir el Proyecto'
            }
        }
        stage('Prueba') {
            steps {
                echo('Probando el proyecto')
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