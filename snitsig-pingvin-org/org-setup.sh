#!/bin/bash

function usage() {
  echo "$0 -p <project> -r <region> -i <ip range>"
}

while getopts "hp:r:i:" arg; do
  case $arg in
    h)
      usage
    ;;
    p)
      PROJECT=$OPTARG
      echo Project: $PROJECT
    ;;
    r)
      REGION=$OPTARG
      echo REGION: $REGION
    ;;
    i)
      IPRANGE=$OPTARG
      echo REGION: $IPRANGE
    ;;
  esac
done

if [ -z ${PROJECT} ] || [ -z ${REGION} ] || [ -z ${IPRANGE} ]
then
  echo "project, region, and iprange must be defined" >&2
  usage >&2
  exit 1
fi

#vpc networks
gcloud compute networks create vpc-access --project=$PROJECT --description=vpc\ for\ connector --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional

if [ $? -eq "0" ]
then
  gcloud compute networks subnets create vpc-access-subnet --project=$PROJECT --description=for\ vpc\ access --range=$IPRANGE --network=vpc-access --region=$REGION
else
  echo "Failed creating vpc-access... Check previous execution line 35" >&2
  exit 1
fi

if [ $? -eq "0" ]
then
  # vpc-connector
  gcloud compute networks vpc-access connectors create vpc-connector     --region $REGION   --subnet vpc-access-subnet --min-instances 2        --max-instances 10
else
  echo "Failed creating vpc-access-subnet... Check previous execution line 39" >&2
  exit 1
fi

if [ $? -eq "0" ]
then
  # add bit for shared vpc networking peering
  gcloud compute networks peerings create vpc-2-default \
      --network=vpc-access \
      --peer-network default 
else
  echo "Failed creating vpc-connector... Check previous execution line 48" >&2
  exit 1
fi

if [ $? -eq "0" ]
then
  gcloud compute networks peerings create default-2-vpc \
      --network=default \
      --peer-network vpc-access 
else
  echo "Failed creating peering... Check previous execution line 57" >&2
  exit 1
fi


if [ $? -eq "0" ]
then
  # create our cloudrun service account
  gcloud iam service-accounts create cloudrun-sa --description="sa for cloud run auth" --display-name="cloudrun-sa"
else
  echo "Failed creating peering... Check previous execution line 67" >&2
  exit 1
fi

if [ $? -eq "0" ]
then
  # create our apigee service account
  gcloud iam service-accounts create apigee-sa --description="sa for apigee to be used for google auth" --display-name="apigee-sa"
else
  echo "Failed creating service account... Check previous execution line 79" >&2
  exit 1
fi

if [ $? -eq "0" ]
then
  echo "network setup for cloudrun complete"
else
  echo "Failed creating service account... Check previous execution line 88" >&2
  exit 1
fi
