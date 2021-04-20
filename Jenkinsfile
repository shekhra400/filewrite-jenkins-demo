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
        WORKERS = "1"
        REGION = "us-east-1"
        WORKER_SIZE = "0.1"
        FILENAME = "target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
        /* ANYPOINT_CLI = "C://Users//shekshukla//AppData//Roaming//npm//anypoint-cli" */
      }
  stages {
   /*
    stage('Project Build') {
      steps {
        sh "mvn clean install" 
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
		echo "$JENKINS_HOME"
		
		sh(""" /var/www/html/scripts/anypoint.sh""")
      
    }
    }
  }
}