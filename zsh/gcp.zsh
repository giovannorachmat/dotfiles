# ======================
# GCP
# ======================
export GCP_ZONE="asia-southeast2-a"

export EMAIL="giovanno.rachmat@oyindonesia.com"
export PROJECT="data-298904"
export ZONE="asia-southeast2-a"

alias gcal="gcloud auth login $EMAIL --project $PROJECT"
alias gcaal="gcloud auth application-default login --account $EMAIL --project $PROJECT"

alias vmdevstart="gcloud compute instances start bi-dev --zone=$ZONE"
alias vmdevstop="gcloud compute instances stop bi-dev --zone=$ZONE"
alias vmexpstart="gcloud compute instances start bi-experimental --zone=$ZONE"
alias vmexpstop="gcloud compute instances stop bi-experimental --zone=$ZONE"

# ======================
# Google Cloud SDK
# ======================

# GCloud completion and path
if [ -f '/home/giovannor/google-cloud-sdk/completion.zsh.inc' ]; then 
  . '/home/giovannor/google-cloud-sdk/completion.zsh.inc'
fi

if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then 
  . "${HOME}/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then 
  . "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi
