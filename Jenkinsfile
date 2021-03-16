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
        nexusArtifactUploader artifacts: [[artifactId: "filewrite-jenkins-demo", classifier: "", file: "C:\Windows\System32\config\systemprofile\AppData\Local\Jenkins\.jenkins\workspace\Filewrite_Jenkins_Pipeline//target\filewrite-jenkins-demo-1.0.0-mule-application.jar", type: "jar"]], credentialsId: "Nexusrepo", groupId: "com.mycompany", nexusUrl: "localhost:9091", nexusVersion: "nexus2", protocol: "http", repository: "http://localhost:9091/repository/filewrite-jenkins-demo", version: "1.0.0"
      }
    }
  }
}