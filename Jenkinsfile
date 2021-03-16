pipeline {
  agent any
  stages {
    stage('build') { 
      steps {
        bat 'mvn clean install'
      }
    }
    stage('Deploy CloudHub') { 
      environment {
        ANYPOINT_CREDENTIALS = credentials('ANYPOINT_CREDENTIALS')
      }
      steps {
        bat 'mvn clean deploy -DmuleDeploy -DskipTests -Dmule.version=4.3.0 -Danypoint.username=shekshukla -Danypoint.password=Kansas@12345 -Denv=Test -Dappname=filewrite-jenkins-demo -Dworkers=1 -DworkerType=Micro -DbusinessGroup="Deloitte Integration Service"'
      }
    }
  }
}