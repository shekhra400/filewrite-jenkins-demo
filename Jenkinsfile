def myVariable = "Deloitte Integration Services"
pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML',defaultValue: 'C://Users//shekshukla//.m2//settings.xml')
  	
  }
  environment {
        ANYPOINT_CRED = credentials('ANYPOINT_CREDENTIALSS') 
      }
  stages {
    stage('Project Build') {
      steps {
        bat "mvn -s ${params.MAVEN_SETTINGS_XML} clean install"
      }
    }
    
    stage('Deploy to Nexus Artifactory') {
      steps {
      	echo "*************Nexus Deployment start**************"
        bat "mvn -s ${params.MAVEN_SETTINGS_XML} deploy:deploy-file -DgroupId=com.mycompany -DartifactId=filewrite-jenkins-demo -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:9091/repository/filewrite-jenkins-demo -Dfile=target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
      }
    }
    
    stage('Deploy CloudHub') {
     
      steps {
      
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

      	echo "*************CloudHub Deployment start**************"
      	
  		/* bat 'npm install -g anypoint-cli@latest'
		#mkdir ~/.anypoint
		#cp $WORKSPACE_TMP/credentials ~/.anypoint/

		#export ANYPOINT_PROFILE="Sandbox"
		#export filename="$(Release.PrimaryArtifactSourceAlias)/drop/target/anypoint-cli-test-1.0.0-SNAPSHOT-mule-application.jar"
		*/
		export filename = "target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
		
		anypoint-cli runtime-mgr cloudhub-application deploy --runtime "$(RUNTIME)" --workers "$(WORKERS)" --workerSize "$(WORKER_SIZE)" --region 
		"$(REGION)" $(APP_NAME) $filename
   
      }
      
    }
    
  }
}