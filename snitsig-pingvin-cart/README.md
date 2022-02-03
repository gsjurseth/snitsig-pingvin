# snitsig-pingvin-cart
This is the cart service. Relies on a backend mongodb instance

## The cloudbuild file
It should deploy the project and cloud run piece. Herein is also some default data that you can import into
the cart service.

## How to execute
This is how we run:

`gcloud builds submit --config=cloudbuild.yaml --substitutions=_REGION=europe-west1 .`

## TODO
The service account pieces are hardcoded and need to be automated
