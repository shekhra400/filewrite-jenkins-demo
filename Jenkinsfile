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
    
     stage('Deploy to Nexus Artifactory') {
      steps {
      	echo "*************Nexus Deployment start***************"
        bat "mvn -s ${params.MAVEN_SETTINGS_XML} deploy:deploy-file -DgroupId=com.mycompany -DartifactId=filewrite-jenkins-demo -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:9091/repository/filewrite-jenkins-demo -Dfile=target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
      }
    }
    
    stage('Deploy CloudHub') {
     environment {
        anypoint = credentials('ANYPOINT_CREDENTIALS')
      }
      steps {
 
      echo "*************CloudHub Deployment start***************"
        bat "mvn deploy -DmuleDeploy -DskipTests -Dmule.version=4.3.0 -Danypoint.username=$anypoint_USR -Danypoint.password=$anypoint_PSW -Denv=Test -Dappname=filewrite-jenkins-demo -Dworkers=1 -DworkerType=Micro -DbusinessGroup='Deloitte Integration Service'"
      }
      
    }
    
  }
}