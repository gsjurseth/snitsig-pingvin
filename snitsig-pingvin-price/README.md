# snitsig-pingvin-price
This is the price service. Relies on a backend mongodb instance

## The cloudbuild file
It should deploy the project and cloud run piece. Herein is also some default data that you can import into
the price service.

## How to execute
This is how we run:

`gcloud builds submit --config=cloudbuild.yaml --substitutions=_REGION=europe-west1 .`

But any commits to this repo should trigger an autobuild of the service

## TODO
The service account pieces are hardcoded and need to be automated
