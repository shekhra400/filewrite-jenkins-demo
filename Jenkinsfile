pipeline {
  agent any
  stages {
    stage('build') { 
      steps {
        bat 'mvn clean install'
      }
    }
    stage('Deploy Nexus') {
      steps {
        bat 'nexusArtifactUploader artifacts: [[artifactId: 'mywebapp', classifier: '', file: 'C:\\Users\\shekshukla\\Documents\\Mule\\exported Projects\\filewrite-jenkins-demo.jar', type: 'jar']], credentialsId: 'Nexusrepo', groupId: 'mywebapp', nexusUrl: 'localhost:9091', nexusVersion: 'nexus2', protocol: 'http', repository: 'file-write-jenkins-demo', version: '1.0-SNAPSHOT''
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