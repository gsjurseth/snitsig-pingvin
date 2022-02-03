#!/bin/bash

# for my mongodb instance
gcloud compute instances create mongodb --project=geirs-purdy-project --zone=europe-west1-b --machine-type=e2-medium --network-interface=network-tier=PREMIUM,subnet=default --maintenance-policy=MIGRATE --service-account=224034048241-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --create-disk=auto-delete=yes,boot=yes,device-name=mongodb,image=projects/debian-cloud/global/images/debian-10-buster-v20220118,mode=rw,size=10,type=projects/geirs-purdy-project/zones/us-central1-a/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any

# for the service account needed for auth between services in cloud run
gcloud iam service-accounts create cloudrun-sa  \
    --description="sa for cloud run auth" \
    --display-name="cloudrun-sa"
