pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML')
  	string(name:'appname')
  	string(name:'env')
  	string(name:'workerType')
  	string(name:'workers')
  	string(name:'workerType')
  	
  	
  }
  environment {
        ANYPOINT_CREDENTIALS = credentials('APCred') 
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
        bat "mvn clean package deploy -Dmule.version=4.3.0 -Dusername=${ANYPOINT_CREDENTIALS_USR} -Dpassword=${ANYPOINT_CREDENTIALS_PSW} -Denv=Test -Dappname=filewrite-jenkins-demo -Dworkers=1 -DworkerType=Micro -DmuleDeploy -DskipTests"
      }
      
    }
    
  }
}