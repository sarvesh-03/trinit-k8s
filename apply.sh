#!/bin/bash
export MINIKUBE_IP=$(minikube ip)

# Start Zookeeper Cluster
envsubst < ./zookeeper/zookeeper-service.yaml | minikube kubectl -- apply -f -
envsubst < ./zookeeper/zookeeper-deployment.yaml | minikube kubectl -- apply -f -

# Start Kafka Cluster
envsubst < ./kafka/kafka-service-headless.yaml | minikube kubectl -- apply -f -
envsubst < ./kafka/kafka-service-external.yaml | minikube kubectl -- apply -f -
envsubst < ./kafka/kafka1.yaml | minikube kubectl -- apply -f -
envsubst < ./kafka/kafka2.yaml | minikube kubectl -- apply -f -

# Start Kafka Connect
envsubst < ./kafka-connect/connect-service.yaml | minikube kubectl -- apply -f -
envsubst < ./kafka-connect/connect-deployment.yaml | minikube kubectl -- apply -f -

# Start Control Center
envsubst < ./control-center/control-center-service.yaml | minikube kubectl -- apply -f -
envsubst < ./control-center/control-center-deployment.yaml | minikube kubectl -- apply -f -

# Start Postgres
envsubst < ./postgres/postgres-service.yaml | minikube kubectl -- apply -f -
envsubst < ./postgres/postgres-deployment.yaml | minikube kubectl -- apply -f -

# Start Cluster Service
envsubst < ./clustering/clustering-service.yaml | minikube kubectl -- apply -f -
envsubst < ./clustering/clustering-deployment.yaml | minikube kubectl -- apply -f -

# Start Backend
envsubst < ./backend/backend-service.yaml | minikube kubectl -- apply -f -
envsubst < ./backend/backend-deployment.yaml | minikube kubectl -- apply -f -