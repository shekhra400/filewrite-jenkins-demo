pipeline {
  agent any
  stages {
    stage('build') { 
      steps {
        bat 'mvn clean install'
        echo "env.JAVA_HOME"
      }
    }
    stage('Deploy Nexus') {
      steps {
        bat "mvn -s C://Users//shekshukla//.m2//settings.xml deploy:deploy-file -DgroupId=com.mycompany -DartifactId=filewrite-jenkins-demo -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:9091/repository/filewrite-jenkins-demo -Dfile=target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
      }
    }
  }
}