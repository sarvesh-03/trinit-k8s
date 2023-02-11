#!/bin/bash

# Stop Backend
minikube kubectl -- delete -f ./backend/backend-deployment.yaml
minikube kubectl -- delete -f ./backend/backend-service.yaml

# Stop Cluster Service
minikube kubectl -- delete -f ./clustering/clustering-deployment.yaml
minikube kubectl -- delete -f ./clustering/clustering-service.yaml

# Stop Postgres
minikube kubectl -- delete -f ./postgres/postgres-deployment.yaml
minikube kubectl -- delete -f ./postgres/postgres-service.yaml

# Stop Control Center
minikube kubectl -- delete -f ./control-center/control-center-deployment.yaml
minikube kubectl -- delete -f ./control-center/control-center-service.yaml

# Stop Kafka Connect
minikube kubectl -- delete -f ./kafka-connect/connect-deployment.yaml
minikube kubectl -- delete -f ./kafka-connect/connect-service.yaml

# Stop Kafka Cluster
minikube kubectl -- delete -f ./kafka/kafka1.yaml
minikube kubectl -- delete -f ./kafka/kafka2.yaml
minikube kubectl -- delete -f ./kafka/kafka-service-external.yaml
minikube kubectl -- delete -f ./kafka/kafka-service-headless.yaml

# Stop Zookeeper Cluster
minikube kubectl -- delete -f ./zookeeper/zookeeper-deployment.yaml
minikube kubectl -- delete -f ./zookeeper/zookeeper-service.yaml