pipeline {
  agent any
  stages {
    stage('build') { 
      steps {
        bat 'mvn clean install'
        echo "new File("{env.JAVA_HOME}")"
      }
    }
    stage('Deploy Nexus') {
    	environment {
    		MY_PATH='C:\\Users\\shekshukla\\Documents\\Mule\\Jenkins\\Github_projects\\target\\filewrite-jenkins-demo-1.0.0-mule-application.jar'
    	}
      steps {
        nexusArtifactUploader artifacts: [[artifactId: "filewrite-jenkins-demo", classifier: "", file: "${MY_PATH}", type: "jar"]], credentialsId: "Nexusrepo", groupId: "com.mycompany", nexusUrl: "localhost:9091", nexusVersion: "nexus2", protocol: "http", repository: "filewrite-jenkins-demo", version: "1.0.0"
      }
    }
  }
}