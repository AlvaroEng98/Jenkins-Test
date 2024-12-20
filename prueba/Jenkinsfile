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
            echo 'Todo FUNCIONO CORRECTAMENTE'
        }
    }


}