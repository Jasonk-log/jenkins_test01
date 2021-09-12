pipeline {
    agent any

    stages {
        stage('Log Ant version info') {
          steps {
            sh '/var/jenkins_home/tools/hudson.tasks.Ant_AntInstallation/Ant_1.10.11/bin/ant -version'
          }
        }
        stage('GitHub Jenkins Ant Build') {
          steps {
            sh '/var/jenkins_home/tools/hudson.tasks.Ant_AntInstallation/Ant_1.10.11/bin/ant dist'
          }
        }        
        stage('Build and Push Docker Image...') {
            steps {
                script {
                  // CUSTOM REGISTRY
                    docker.withRegistry('https://myregistry.images.io:30000') {
                      
                        /* Build the container image */            
                        def dockerImage = docker.build("my-image:${env.BUILD_ID}")
                      
                        /* Push the container to the custom Registry */
                        dockerImage.push()
                      
                    }
                    /* Remove docker image*/
                    sh "docker rmi -f my-image:${env.BUILD_ID}"
               }
            } 
        }
        stage('Test kubectl') {
            steps {
                echo 'Testing kubectl..'
                sh "kubectl patch deployment my-test -n test -p'{"spec":{"template":{"spec":{"containers":[{"name":"my-container","image":"myregistry.images.io:30000/my-image:${env.BUILD_ID}"}]}}}}'"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
