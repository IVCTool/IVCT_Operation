#!/bin/bash
kubectl apply -f 01_nfs-pv.yaml
kubectl apply -f 02_nfs-pvc.yaml
kubectl apply -f 11_runtime-config_job.yaml
kubectl apply -f 12_ts-helloworld-job.yaml
kubectl apply -f 13_ts-hla-encoding-rules_job.yaml
kubectl apply -f 14_ts-hla-cs-verification_job.yaml
kubectl apply -f 15_ts-hla-service_job.yaml
kubectl apply -f 16_ts-hla-object_job.yaml
kubectl apply -f 17_ts-hla-declaration_job.yaml
kubectl apply -f 18_ts-designator_job.yaml

