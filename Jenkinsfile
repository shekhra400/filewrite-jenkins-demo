pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML', defaultValue: 'C://Users//shekshukla//.m2//settings.xml', description:'Please provide the path of maven settings.xml')
  }
  stages {
    stage('Project Build') {
      steps {
        bat "mvn -s ${params.MAVEN_SETTINGS_XML} clean install"
      }
    }
    
    stage('Deploy CloudHub') {
      environment {
        anypoint = credentials('ANYPOINT_CREDENTIALS')
      }
      steps {
      echo "*************CloudHub Deployment start***************"
      echo "*************${anypoint_USR}***************"
      echo "*************${anypoint_PSW}***************"
        bat 'mvn clean deploy -DmuleDeploy -DskipTests -Dmule.version=4.3.0 -Danypoint.username=$ANYPOINT_CREDENTIALS_USR -Danypoint.password=$ANYPOINT_CREDENTIALS_PSW -Denv=Test -Dappname=filewrite-jenkins-demo -Dworkers=1 -DworkerType=Micro -DbusinessGroup="Deloitte Integration Service"'
      }
    }
    
  }
}