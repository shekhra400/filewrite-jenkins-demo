pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS', defaultValue: 'C://Users//shekshukla//.m2//settings.xml')
  }
  stages {
  	when {
  		expression {
  			params.MAVEN_SETTINGS
  		}
  	}
    stage('Project Build') { 
      steps {
        bat "mvn -s ${params.MAVEN_SETTINGS} clean install"
      }
    }
    stage('Deploy to Nexus Artifactory') {
      steps {
        bat "mvn deploy:deploy-file -DgroupId=com.mycompany -DartifactId=filewrite-jenkins-demo -Dversion=1.0.0 -DgeneratePom=true -Dpackaging=jar -DrepositoryId=nexus -Durl=http://localhost:9091/repository/filewrite-jenkins-demo -Dfile=target/filewrite-jenkins-demo-1.0.0-mule-application.jar"
      }
    }
    
  }
}