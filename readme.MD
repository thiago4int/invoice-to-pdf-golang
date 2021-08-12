.

https://cloud.google.com/storage/docs/pubsub-notifications


```
gsutil notification create -t new-doc -f json -e OBJECT_FINALIZE gs://invoice-to-pdf-output
```
https://cloud.google.com/run/docs/quickstarts/prebuilt-deploy

```
gcloud iam service-accounts create pubsub-cloud-run-invoker --display-name "PubSub Cloud Run Invoker"
```

PROJECT_NUMBER=$(gcloud projects list \
 --format="value(PROJECT_NUMBER)" \
 --filter="$GOOGLE_CLOUD_PROJECT")

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
  --member=serviceAccount:service-$PROJECT_NUMBER@gcp-sa-pubsub.iam.gserviceaccount.com \
  --role=roles/iam.serviceAccountTokenCreator

gcloud pubsub subscriptions create pdf-conv-sub \
  --topic new-doc \
  --push-endpoint=$SERVICE_URL \
  --push-auth-service-account=pubsub-cloud-run-invoker@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com
