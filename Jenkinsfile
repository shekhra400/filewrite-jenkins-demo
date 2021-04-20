def myVariable = "Deloitte Integration Services"
pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML',defaultValue: 'C://Users//shekshukla//.m2//settings.xml')
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
        FILENAME = "target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
      }
  stages {
   /*
    stage('Project Build') {
      steps {
        bat "mvn -s ${params.MAVEN_SETTINGS_XML} clean install" 
      }
    }
    */
    
    stage('Deploy CloudHub') {
     
      steps {
     
      	echo "*************CloudHub Deployment start**************"
      	
      	
      	
       /*	
       bat 'npm install -g anypoint-cli@latest'
      	bat 'mkdir .anypoint'
      	bat 'copy C://Users//shekshukla//.anypoint//credentials //.anypoint//'
       bat 'copy C://Users//shekshukla//.anypoint//credentials ~//.anypoint//'
  		
		#mkdir ~/.anypoint
		#cp $WORKSPACE_TMP/credentials ~/.anypoint/

		#export ANYPOINT_PROFILE="Sandbox"
		#export filename="$(Release.PrimaryArtifactSourceAlias)/drop/target/anypoint-cli-test-1.0.0-SNAPSHOT-mule-application.jar"
		
		export filename = "target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
		*/
		
		
		bat "C://Users//shekshukla//AppData//Roaming//npm//anypoint-cli --username=${ANYPOINT_CRED_USR} --password=${ANYPOINT_CRED_PSW} runtime-mgr cloudhub-application deploy --environment 'Test' --runtime '4.3.0' --workers '1' --workerSize '0.1' --region 'us-east-1' 'asas' 'target/filewrite-jenkins-demo-1.0.0-mule-application.jar'"
   
      }
      
    }
    
  }
}