# snitsig-pingvin
Parent repo for all submodules: org, mongodb, microservices, graphql, apigee, and org

The vast majority of these repos contain an associated `cloudbuild.yaml`. What I've done
is to create triggers for each of these (and in the case of masterdata for both `main` and 
`develop` branches) so that we can show a complete CI/CD enabled SDLC.

## mongodb
There is a repo to spin up a mongodb instance that the shopping services rely on for their
data persistence. This is really the first one that should be configured

## org
There are several org level pieces that need to be configured to make everything work. Notably,
there are vpc-peering and a new VPC connector that needs to be setup. Examples in the org repo
show how to get this done.

## microservices
Each microservice is built as a cloudrun service written in Nodejs. The following are available

### Shopping services
* masterdata
  Service for description, name, and image
  * Also contains a branch, develop, that demonstrates how we one might deploy from an OAS alone
  and without an existing apigee proxy as a template.
* warehouse
  Service for inventory of items
* price
  Service for pricing of items
* cart
  Service for a shopping cart (indexed on email)

### GraphQL service
Finally, there is a graphql service with schema containing typedefinitions for all the above
mentioned microservices. This repo also contains an apigee workspace (to be used with VSCode) with an apigee proxy that can be
configured to use the cloudrun service as its backend.

## apigee
The apiee repo simply contains an apigee-workspace (to be used with VSCode) that provides a
mashup proxy called `catalog`. Use this proxy to demonstrate how we can easily deploy proxies from VSCode and
do so while providing auto-generated authentication details to call CloudRun.
