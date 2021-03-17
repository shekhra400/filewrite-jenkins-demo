pipeline {
  agent any
  stages {
    stage('Project Build') { 
      steps {
        bat 'mvn clean install'
        echo "env.JAVA_HOME"
      }
    }
    stage('Deploy to Nexus Artifactory') {
      steps {
      echo "${env.JAVA_HOME}"
        bat "mvn -s C://Users//shekshukla//.m2//settings.xml clean deploy:deploy-file -DgroupId=com.mycompany -DartifactId=filewrite-jenkins-demo -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:9091/repository/filewrite-jenkins-demo -Dfile=target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
      }
    }
    stage('Deploy to  CloudHub') {
      environment {
        ANYPOINT_CREDENTIALS = credentials('ANYPOINT_CREDENTIALS')
      }
      steps {
        bat 'mvn clean deploy -DmuleDeploy -DskipTests -Dmule.version=4.3.0 -Danypoint.username=shekshukla -Danypoint.password=Kansas@12345 -Denv=Test -Dappname=filewrite-jenkins-demo -Dworkers=1 -DworkerType=Micro -DbusinessGroup="Deloitte Integration Service"'
      }
    }
  }
}