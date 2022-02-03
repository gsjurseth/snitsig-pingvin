# snitsig-pingvin-masterdata
This is the masterdata service. Relies on a backend mongodb instance

## The cloudbuild file
It should deploy the project and cloud run piece. Herein is also some default data that you can import into
the masterdata service.

You can update the BUCKET environment variable to change which bucket is used to store images

## How to execute
This is how we run:

`gcloud builds submit --config=cloudbuild.yaml --substitutions=_REGION=europe-west1 .`

## TODO
The service account pieces are hardcoded and need to be automated
