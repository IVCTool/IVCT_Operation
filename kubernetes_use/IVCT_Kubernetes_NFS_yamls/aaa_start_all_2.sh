#!/bin/bash

kubectl apply -f 31_activemq_deployment.yaml
kubectl apply -f 32_activemq_service.yaml

kubectl apply -f 33_logsink_deployment.yaml
kubectl apply -f 36_gui_deployment.yaml
#kubectl apply -f 37b_gui_service.yaml
kubectl apply -f 37_gui_service.yaml
#kubectl apply -f 38b_tc-runner-po_deploy.yaml
kubectl apply -f 38_tc-runner-pi_deploy.yaml
kubectl apply -f 39_tc-runner-pi_service.yaml
#kubectl apply -f  41_sut-hellowordl-pi_deployment.yaml
#kubectl apply -f 42_sut-helloworld-pi_service.yaml
