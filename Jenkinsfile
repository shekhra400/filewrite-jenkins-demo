
pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML',defaultValue: 'C://Users//shekshukla//.m2//settings.xml')
  }
  environment {
        ANYPOINT_CRED = credentials('ANYPOINT_CREDENTIALSS')
        ENVIRONMENT = "Test"
        BUSEINSSGROUP = "Deloitte integration services"
        APP_NAME = "filewrite-jenkins-demo"
        MULE_VERSION= '4.3.0'
        WORKERS = "1"
        REGION = "us-east-1"
        WORKER_SIZE = "0.1"
        FILENAME = "target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
        /* ANYPOINT_CLI = "C://Users//shekshukla//AppData//Roaming//npm//anypoint-cli" */
        BUSINESS_GROUP = "Deloitte Integration Services"
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
      	echo "*************CloudHub Deployment start**************"
        bat 'mvn clean deploy -DmuleDeploy -DskipTests -Dmule.version=%MULE_VERSION% -Danypoint.username="%ANYPOINT_CRED_USR%" -Danypoint.password="%ANYPOINT_CRED_PSW%" -Dcloudhub.env="%ENVIRONMENT%" -Dappname="%APP_NAME%" -Dworkers=%WORKERS% -DworkerType="%WORKER_TYPE%" -Dcloudhub.bg="%BUSEINSSGROUP%"'
      }
	}
  }
}