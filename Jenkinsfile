pipeline {
  agent any
  parameters {
  	string(name:'MAVEN_SETTINGS_XML', defaultValue: 'C://Users//shekshukla//.m2//settings.xml', description:'Please provide the path of maven settings.xml')
  }
  stages {
    stage('Project Build') {
    	
      steps {
      	withCredentials([usernamePassword(credentialsId: 'ANYPOINT_CREDENTIALS', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
		  // available as an env variable, but will be masked if you try to print it out any which way
		  // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
		  echo '--------${USERNAME}-----'
		  echo '--------$USERNAME-----'
		  echo "--------${USERNAME}-----"
		  echo "--------$USERNAME-----"
		  // also available as a Groovy variable
		  echo USERNAME
		  // or inside double quotes for string interpolation
		  echo "username is $USERNAME"
		}
		echo "--------$USERNAME-----"
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
      echo "-------------${anypoint_USR}---------------"
      echo "--------------${anypoint_PSW}-------------"
        bat "mvn clean deploy -DmuleDeploy -DskipTests -Dmule.version=4.3.0 -Danypoint.username=$ANYPOINT_CREDENTIALS_USR -Danypoint.password=$ANYPOINT_CREDENTIALS_PSW -Denv=Test -Dappname=filewrite-jenkins-demo -Dworkers=1 -DworkerType=Micro -DbusinessGroup='Deloitte Integration Service'"
      }
    }
    
  }
}