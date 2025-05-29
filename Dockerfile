# Construir la imagen
gcloud builds submit --tag gcr.io/TU-PROYECTO/vmess-hydra

# Desplegar a Cloud Run
gcloud run deploy vmessmx \
  --image gcr.io/TU-PROYECTO/vmess-hydra \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --port 8080
