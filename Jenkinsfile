def myVariable = "Deloitte Integration Services"
pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML',defaultValue: 'C://Users//shekshukla//.m2//settings.xml')
  }
  
  tools {
  			nodejs "node"
  			maven "maven"
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
      }
  stages {
  
    stage('Project Build') {
      steps {
        sh "mvn clean install"
      }
    }
    
    stage('Deploy CloudHub') {
     
      steps {
      	echo "*************CloudHub Deployment start**************"
      		
       /*	
      	ret=sh(script: 'anypoint-cli runtime-mgr cloudhub-application describe ${APP_NAME} --output json --fields Domain', returnStdout: true).trim()
		println ret
      
       	sh 'anypoint-cli runtime-mgr cloudhub-application deploy --environment="Test" --runtime ${MULE_VERSION} --workers ${WORKERS} --workerSize ${WORKER_SIZE} --region ${REGION} ${APP_NAME} ${FILENAME}' 
       */
       
       script {
       		BUILD_FULL = sh (
			    script: "anypoint-cli runtime-mgr cloudhub-application describe ${APP_NAME}",
			    returnStdout: true
			).trim()
			echo ${BUILD_FULL}
       }
       
      }
    }
  }
}