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
    
    stage('Deploy CloudHub') {
     
      steps {
      

      echo "*************CloudHub Deployment start**************"
        bat "mvn clean deploy -DmuleDeploy -DskipTests -Dmule.version=4.3.0 -Danypoint.username=${ANYPOINT_CRED_USR} -Danypoint.password=${ANYPOINT_CRED_PSW} -Denv=Test -Dappname=filewrite-jenkins-demo1 -Dworkers=1 -DworkerType=Micro -DbusinessGroup='Deloitte Integration Services'"
      }
      
    }
    
  }
}