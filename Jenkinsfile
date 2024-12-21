pipeline {

    agent any

    stages {
        stage('Inicializar') {
            steps {
                echo 'Inicializando el Proyecto'
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