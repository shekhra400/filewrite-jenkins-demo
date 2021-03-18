pipeline {
  agent any
  stages {
    stage('Project Build') { 
      steps {
        bat 'mvn clean install'
      }
    }
    stage('Deploy to Nexus Artifactory') {
      steps {
        bat "mvn deploy:deploy-file -DgroupId=com.mycompany -DartifactId=filewrite-jenkins-demo -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:9091/repository/filewrite-jenkins-demo -Dfile=target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
      }
    }
    
  }
}