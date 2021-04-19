def myVariable = "Deloitte Integration Services"
pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML',defaultValue: 'C://Users//shekshukla//.m2//settings.xml')
  	string(name:'FILENAME',defaultValue: 'target/filewrite-jenkins-demo-1.0.0-mule-application.jar')
  	
  }
  environment {
        ANYPOINT_CRED = credentials('ANYPOINT_CREDENTIALSS')
        ENVIRONMENT = "Sandbox"
        BUSEINSSGROUP = "Deloitte integration services"
        APP_NAME = "filewrite-jenkins-demo"
        MULE_VERSION= '4.3.0'
        WORKERS = 1
        REGION = "us-east-1"
        WORKER_SIZE = "0.1"
      }
  stages {
    stage('Project Build') {
      steps {
        bat "mvn -s ${params.MAVEN_SETTINGS_XML} clean install"
      }
    }
    
    stage('Deploy CloudHub') {
     
      steps {
     
      	echo "*************CloudHub Deployment start**************"
      	
  		 bat 'npm install -g anypoint-cli@latest'
  		 /*
		#mkdir ~/.anypoint
		#cp $WORKSPACE_TMP/credentials ~/.anypoint/

		#export ANYPOINT_PROFILE="Sandbox"
		#export filename="$(Release.PrimaryArtifactSourceAlias)/drop/target/anypoint-cli-test-1.0.0-SNAPSHOT-mule-application.jar"
		
		export filename = "target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
		*/
		
		
		bat 'C:\Users\shekshukla\AppData\Roaming\npm\anypoint-cli runtime-mgr cloudhub-application list'
   
      }
      
    }
    
  }
}