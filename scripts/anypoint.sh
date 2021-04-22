#! /bin/bash

#import configurations
#source app.config

echo "anypoint cli start"
echo "****DEPLOY_CLOUDHUB new application****"
anypoint-cli runtime-mgr cloudhub-application deploy --environment="Test" --runtime ${MULE_VERSION} --workers ${WORKERS} --workerSize ${WORKER_SIZE} --region ${REGION} ${APP_NAME} ${FILENAME}



